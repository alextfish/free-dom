Feature: Poor House
  +$4. Reveal your hand. -$1 per Treasure card in your hand, to a minimum of $0.
    
  Background:
    Given I am a player in a standard game with Poor House
  
  Scenario: Poor House should be set up at game start
    Then there should be 10 Poor House cards in piles
      And there should be 0 Poor House cards not in piles
  
  Scenario: Playing Poor House with no Treasures
    Given my hand contains Poor House, Estate x2, Chapel x2
      And it is my Play Action phase
    When I play Poor House
    Then I should have 4 cash
      And it should be my Play Treasure phase
      
  Scenario: Playing Poor House with one Treasure
    Given my hand contains Poor House, Great Hall, Harem, Nobles
      And it is my Play Action phase
    When I play Poor House
    Then I should have 3 cash
      And it should be my Play Treasure phase
      
  Scenario: Playing Poor House with $1 and six Treasures in hand (bottoms out at zero)
    Given my hand contains Market, Poor House, Copper x6
      And my deck contains Estate x10
      And it is my Play Action phase
    When I play Market
      Then I should have drawn a card
      And I should have 1 cash
    When I play Poor House
      Then I should have 0 cash
      And it should be my Play Treasure phase
    When I play simple treasures
      Then I should have 6 cash
      
  Scenario: Playing 2x Poor House (drawing a treasure in between) add different amounts
    Given my hand contains Poor House x2, Village x2, Copper
      And my deck contains Gold x10
      And it is my Play Action phase
    When I play Village
      Then I should have drawn a card
    When I play Poor House
      Then I should have 3 cash
      And it should be my Play Action phase
    When I play Village
      Then I should have drawn a card
    When I play Poor House
      Then I should have 5 cash
      And it should be my Play Action phase
