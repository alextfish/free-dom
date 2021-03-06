class Intrigue::Ironworks < Card
  costs 4
  action
  card_text "Action (cost: 4) - Gain a card costing up to 4. If it's an: Action => +1 Action; Treasure => +1 Cash; Victory => Draw 1 card."

  def play(parent_act)
    super

    # Add a PendingAc... y'know what? It's exactly the same as Workshop.
    parent_act.children.create!(:expected_action => "resolve_#{self.class}#{id}_take",
                               :text => "Take a card with Ironworks",
                               :player => player,
                               :game => game)
    return "OK"
  end

  def determine_controls(player, controls, substep, params)
    case substep
    when "take"
      controls[:piles] += [{:type => :button,
                            :action => :resolve,
                            :text => "Take",
                            :nil_action => nil,
                            :params => {:card => "#{self.class}#{id}",
                                        :substep => "take"},
                            :piles => game.piles.map do |pile|
                              pile.cost <= 4 and not pile.empty?
                            end
                          }]
    end
  end

  def resolve_take(ply, params, parent_act)
    # We expect to have been passed a :pile_index
    if not params.include? :pile_index
      return "Invalid parameters"
    end

    # Processing is pretty much the same as a buy; code shamelessly yoinked from
    # Player.buy.
    if ((params.include? :pile_index) and
           (params[:pile_index].to_i < 0 or
            params[:pile_index].to_i > game.piles.length - 1))
      # Asked to take an invalid card (out of range)
      return "Invalid request - pile index #{params[:pile_index]} is out of range"
    elsif params.include? :pile_index and not game.piles[params[:pile_index].to_i].cost <= 4
      # Asked to take an invalid card (too expensive)
      return "Invalid request - card #{game.piles[params[:pile_index]].card_type} is too expensive"
    end


    # Process the take. Add a game-level action to grant the bonuses after the
    # card has been gained
    card = game.piles[params[:pile_index].to_i].cards[0]
    parent_act = parent_act.children.create!(:expected_action => "resolve_#{self.class}#{id}_bonuses;card=#{card.id}",
                                             :game => game)
    game.histories.create!(:event => "#{ply.name} took #{card.readable_name} from the Ironworks.",
                          :css_class => "player#{ply.seat} card_gain")

    ply.gain(parent_act, :pile => card.pile)

    return "OK"
  end

  def bonuses(params)
    # We expect a card ID
    if !params.include?(:card)
      return "Invalid parameters in game action!"
    end

    parent_act = params[:parent_act]
    card = Card.find(params[:card].to_i)

    # Now grant any bonuses
    if card.is_action?
      player.add_actions(1, parent_act)
    end
    if card.is_treasure?
      player.add_cash(1)
    end
    if card.is_victory?
      player.draw_cards(1)
    end

    return "OK"
  end
end
