class BaseGame::Library < Card
  costs 5
  action
  card_text "Action (cost: 5) - Draw until you have 7 cards in hand. You may set " +
                       "aside any Action cards you draw this way, as you " +
                       "draw them; discard the set-aside cards after you " +
                       "finish drawing."

  def play(parent_act)
    super

    # Library is heavily re-entrant, so we'll put its processing in a "clean"
    # subfunction
    process(parent_act)
  end

  # Function to handle the actions dictated by Library. Expected to be called
  # by both play() and resolve_choice()
  def process(parent_act)
    # Assume we're just going to draw up to 7 cards; we'll break out of the loop
    # if we hit an action
    num_to_draw = 7 - player.cards.hand(true).size
    clear_up = true

    1.upto(num_to_draw) do |n|
      drawn = player.draw_cards(1)

      # If we didn't actually draw a card - so deck and discard are empty - give
      # up (or we'd just loop a bit more than we want).
      break if drawn.length == 0

      if drawn[0].is_action?
        # Drawn an action. Set up a PendingAction to ask whether we should set
        # this card aside.
        act = parent_act.children.create!(:expected_action => "resolve_#{self.class}#{id}_choose",
                                         :text => "Set aside or keep a card.")
        act.player = player
        act.game = game
        act.save!

        # Drop out and wait for choice
        clear_up = false
        break
      end
    end

    if clear_up
      discard_set_aside
    end

    return "OK"
  end

  def determine_controls(player, controls, substep, params)
    case substep
    when "choose"
      # Player deciding whether to keep or set aside a drawn action.
      # Technically, this would make sense as a Radio Button control - but that
      # needs two clicks, and is likely to get irritating.
      controls[:hand] += [{:type => :button,
                          :action => :resolve,
                          :text => "Set Aside",
                          :nil_action => "Keep",
                          :params => {:card => "#{self.class}#{id}",
                                      :substep => "choose"},
                          :cards => ([false] * (player.cards.hand.size - 1)) + [true]
                         }]
    end
  end

  resolves(:choose).validating_params_has_any_of(:card_index, :nil_action).
                    validating_param_is_card(:card_index, scope: :hand).
                    validating_param_satisfies(:card_index) { |value, context| value.to_i == context.actor.cards.hand.count - 1 }.
                    with do
    if params.include? :nil_action
      # Player chose not to set aside. That's hidden information, but anyone manically
      # refreshing would have seen the pending action - so write a history.
      game.histories.create!(:event => "#{actor.name} chose not to set a card aside.",
                            :css_class => "player#{actor.seat}")
    else
      card = actor.cards.hand[-1]
      actor.cards.revealed(true) << card
      card.location = "library"
      card.revealed = true
      card.save!
      game.histories.create!(:event => "#{actor.name} set aside #{card.class.readable_name}.",
                            :css_class => "player#{actor.seat}")
    end

    # Carry on processing
    process(parent_act)
  end

  def discard_set_aside
    # Move all revealed cards to Discard, and unreveal them
    # Force a reload of all affected areas
    player.cards.revealed(true).each do |card|
      card.discard
    end
  end

end
