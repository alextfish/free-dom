Feature: Feodum
  Victory - Worth 1 VP for every 3 Silvers in your deck. / When you trash this, gain 3 Silvers.

  Scenario Outline: Feodum should be set up at game start
    Given I am a player in a <num>-player standard game with Feodum
      Then there should be <pile count> Feodum cards in piles
      And there should be 0 Feodum cards not in piles
      And the Feodum pile should cost 4

    Examples:
      | num | pile count |
      |  2  |     8      |
      |  3  |    12      |
      |  4  |    12      |
      |  5  |    12      |
      |  6  |    12      |

  Scenario Outline: Feodum should be worth points==(Silvers in any zone)/3
    Given I am a player in a standard game with Feodum
      And my hand contains Feodum, Copper, Silver x<hand>
      And my deck contains Gold x3, Silver x<deck>
      And I have Royal Seal x2, Silver x<discard> in discard
    When the game ends
    Then my score should be <score>

    Examples:
     | hand | deck | discard | score |
     |   0  |  0   |    0    |   0   |
     |   2  |  0   |    0    |   0   |
     |   3  |  0   |    0    |   1   |
     |   1  |  1   |    2    |   1   |
     |   3  |  2   |    3    |   2   |
     |   6  |  2   |    1    |   3   |
     |   0  |  5   |    5    |   3   |

  Scenario: Feodum should contribute to score from all zones
    Given I am a player in a standard game
      And my hand contains Feodum, Silver x3
      And my deck contains Feodum
      And I have Feodum in discard
      And I have Feodum in play
    When the game ends
    Then my score should be 4

  Scenario: Trashing to Remodel
    Given I am a player in a standard game with Feodum
      And my hand contains Feodum, Remodel, Copper
    When I play Remodel
    Then I should need to Trash a card with Remodel
    When I choose Feodum in my hand
      Then the following 2 steps should happen at once
    Then I should have trashed Feodum from my hand
      And I should have gained Silver x3
    And I should need to Take a replacement card with Remodel
    
  Scenario: Trashing to opponent's Saboteur
    Given I am a player in a standard game with Feodum
    Given my deck contains Feodum and 4 other cards
      And Bob's hand contains Saboteur
      And Charlie's hand is empty
      And it is Bob's Play Action phase
    When Bob plays Saboteur
      And the game checks actions
      Then the following 2 steps should happen at once
    Then I should have trashed Feodum from my deck
      And I should have gained Silver x3
    And I should need to Take a replacement card with Saboteur
    
  Scenario: Trashing 3x to Chapel
    Given I am a player in a standard game with Feodum
      And my hand contains Feodum x3, Chapel
    When I play Chapel
    Then I should need to Trash up to 4 cards with Chapel
    When I choose Feodum in my hand
      Then the following 2 steps should happen at once
    Then I should have trashed Feodum from my hand
      And I should have gained Silver x3
      And I should need to Trash up to 3 cards with Chapel
    When I choose Feodum in my hand
      Then the following 2 steps should happen at once
    Then I should have trashed Feodum from my hand
      And I should have gained Silver x3
      And I should need to Trash up to 2 cards with Chapel
    When I choose Feodum in my hand
      Then the following 2 steps should happen at once
    Then I should have trashed Feodum from my hand
      And I should have gained Silver x3
      And I should need to Trash up to 1 card with Chapel
  