class Intrigue::Duke < Card
  costs 5
  pile_size {|num_players|  case num_players
                            when 1..2
                              8
                            when 3..6
                              12
                            end}
  victory {player.cards(true).count(:conditions => "type = 'BasicCards::Duchy'")}
  card_text "Victory (cost: 5) - 1 point per Duchy in your deck."
end