class Hinterlands::Tunnel < Card
  costs 3
  victory :points => 2
  reaction :to => :discard
  pile_size {|num_players|  case num_players
                            when 1..2
                              8
                            when 3..6
                              12
                            end}

  card_text "Reaction/Victory (cost: 3) - " +
            "When you discard this other than during a Clean-up phase, you may reveal it. If you do, gain a Gold." +
            " / 2 points"
end