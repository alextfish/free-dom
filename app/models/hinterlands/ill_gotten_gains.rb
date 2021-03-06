class Hinterlands::IllGottenGains < Card
  treasure :special => true
  costs 5
  card_text "Treasure (costs: 5) - 1 Cash. When you play this, you may gain a Copper, putting it into your hand. " +
            "/ When you gain this, each other player gains a Curse."

  def self.readable_name
    "Ill-Gotten Gains"
  end

  def play_treasure(parent_act)
    super

    # Start by granting the cash
    player.add_cash(1)

    if player.settings.autoigg == Settings::ALWAYS
      # Player is automatically taking the Copper
      resolve_copper(player, {:choice => 'accept'}, parent_act)
    elsif player.settings.autoigg == Settings::NEVER
      # Player is automatically refusing the Copper
      resolve_copper(player, {:choice => 'decline'}, parent_act)
    else
      # Actually need to ask the player
      parent_act.children.create!(:expected_action => "resolve_#{self.class}#{id}_copper",
                                  :text => "Choose whether to gain a Copper to hand",
                                  :player => player,
                                  :game => game)
    end

    "OK"
  end

  def determine_controls(player, controls, substep, params)
    case substep
    when "copper"
      controls[:player] += [{:type => :buttons,
                             :label => "Gaining #{self}:",
                             :params => {:card => "#{self.class}#{id}",
                                         :substep => "copper"},
                             :options => [{:text => "Copper to hand",
                                           :choice => "accept"},
                                          {:text => "Don't gain a Copper",
                                           :choice => "decline"}]
                            }]
    end
  end

  resolves(:copper).validating_params_has(:choice).
                    validating_param_value_in(:choice, 'accept', 'decline').
                    with do
    # Everything looks fine. Carry out the requested choice
    if params[:choice] == "decline"
       # Chose not to gain a Copper. Just log
       game.histories.create!(:event => "#{actor.name} chose not to gain a #{BasicCards::Copper.readable_name}.",
                              :css_class => "player#{actor.seat}")
    else
      # Gain a Copper
      game.histories.create!(:event => "#{actor.name} chose to gain a #{BasicCards::Copper.readable_name}.",
                             :css_class => "player#{actor.seat} card_gain")
      copper_pile = game.piles.find_by_card_type("BasicCards::Copper")
      actor.gain(parent_act, :pile => copper_pile, :location => "hand")
    end

    "OK"
  end

  # Notice a gain event. If it's Ill-Gotten Gains itself, grant each other player a Curse.
  def self.witness_gain(params)
    ply = params[:gainer]
    card = params[:card]
    parent_act = params[:parent_act]
    game = ply.game

    # Check whether the card gained is IGG, and if so give out Curses
    if card.class == self
      curses = game.piles.find_by_card_type("BasicCards::Curse")
      ply.other_players.each do |opp|
        game.histories.create!(:event => "#{opp.name} gained #{curses.card_class.readable_name} due to #{readable_name}.",
                               :css_class => "player#{opp.seat} card_gain")
        opp.gain(parent_act, :pile => curses)
      end
    end

    # IGG's Curse gains don't affect the gain of IGG at all
    return false
  end
end