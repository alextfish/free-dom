Feature: Tunnel
    2 VP
    When you discard this other than during a Clean-up phase, you may reveal it. If you do, gain a Gold.

  Scenario Outline: Tunnel should be set up at game start
    Given I am a player in a <num>-player standard game with Tunnel
    Then there should be <pile count> Tunnel cards in piles
      And there should be 0 Tunnel cards not in piles

    Examples:
      | num | pile count |
      |  2  |     8      |
      |  3  |    12      |
      |  4  |    12      |
      |  5  |    12      |
      |  6  |    12      |

  Scenario: Tunnel should be worth 2 points
    Given I am a player in a standard game
      And my hand is empty
      And my deck contains Tunnel
    When the game ends
    Then my score should be 2

  Scenario: Tunnel should contribute to score from all zones
    Given I am a player in a standard game
      And my hand contains Tunnel
      And my deck contains Tunnel
      And I have Tunnel in discard
      And I have Tunnel in play
    When the game ends
    Then my score should be 8