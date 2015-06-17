Feature: Knights
  Ten varying cards in one supply pile, all with this line of text:
  Each other player reveals the top 2 cards of his deck, trashes one of them costing from $3 to $6, and discards the rest. If a Knight is trashed by this, trash this card.
  
  Dame Anna; Action – Attack – Knight; $5; You may trash up to 2 cards from your hand.
  Dame Josephine; Action – Attack – Victory – Knight;  $5; Worth 2 VP.
  Dame Molly; Action – Attack – Knight; $5; +2 Actions.
  Dame Natalie; Action – Attack – Knight; $5; You may gain a card costing up to $3.
  Dame Sylvia; Action – Attack – Knight; $5; +$2
  Sir Bailey; Action – Attack – Knight; $5; +1 Card;  +1 Action
  Sir Destry; Action – Attack – Knight; $5; +2 Cards
  Sir Martin; Action – Attack – Knight; $4; +2 Buys
  Sir Michael; Action – Attack – Knight; $5; Each other player discards down to 3 cards in hand.
  Sir Vander; Action – Attack – Knight; $5; When this is trashed, gain a Gold.

  For testing purposes, the pile (normally randomised at game start) is overridden to be sorted alphabetically.
  
  Background:
    Given I am a player in a standard game with Knights

  Scenario: Knights should be set up at game start
    Then there should be 0 Knights cards not in piles
      And there should be 1 Dame Anna card in piles
      And there should be 1 Dame Josephine card in piles
      And there should be 1 Dame Molly card in piles
      And there should be 1 Dame Natalie card in piles
      And there should be 1 Dame Sylvia card in piles
      And there should be 1 Sir Bailey card in piles
      And there should be 1 Sir Destry card in piles
      And there should be 1 Sir Martin card in piles
      And there should be 1 Sir Michael card in piles
      And there should be 1 Sir Vander card in piles

  Scenario Outline: Playing Knights, no knights hit
    Given I am a player in a 6-player standard game with Knights
      And Bob has Lighthouse as a duration
      And Charlie's deck contains Silver x5
      And Dave's deck contains Estate, Province x5
      And Ethelred's deck contains Mine, Copper
      And Fred's deck contains Silver, Gold
    Given my hand contains <knight>
      And Bob's hand contains Gold x5
      And Charlie's hand contains Estate x3
      And Dave's hand contains Estate x2, Copper x2
      And Ethelred's hand contains Estate 
      And Fred's hand contains Gold x2
    When I play <knight>
    Then the following 9 steps should happen at once
      Then I should have <actions> actions available
      And <extra verification>
      When the game checks actions   # for the Sir Michael case
      Then Charlie should have trashed Silver from his deck
      And Charlie should have discarded Silver from his deck
      And Dave should have discarded Estate, Province from his deck
      And Ethelred should have trashed Mine from his deck
      And Ethelred should have discarded Copper from his deck
      And Fred should need to Choose a card to trash with <knight>
    And Bob should be revealing nothing
      And Charlie should be revealing nothing
      And Dave should be revealing nothing
      And Ethelred should be revealing nothing
      And Fred should be revealing Silver, Gold
    When Fred chooses his peeked Silver
      And the game checks actions
    Then the following 2 steps should happen at once
      Then Fred should have trashed Silver from his deck
      And Fred should have discarded Gold from his deck
  
    Examples:
      | knight         | actions |  extra verification                       
      | Dame Josephine |    0    | I should have 0 cash available            
      | Dame Molly     |    2    | I should have 2 actions available         
      | Dame Sylvia    |    0    | I should have 2 cash available            
      | Sir Bailey     |    1    | I should have drawn a card                
      | Sir Destry     |    0    | I should have drawn 2 cards               
      | Sir Martin     |    0    | I should have 3 buys available            
      | Sir Michael    |    0    | Dave chooses to discard his Estate in hand
      | Sir Vander     |    0    | I should have 0 cash available            
  
  Scenario Outline: Playing Knights, hitting another knight; also small decks
    Given I am a player in a 4-player standard game with Knights
      And my deck contains Estate x10
      And Bob's deck contains Dame Anna, Gold
      And Charlie's deck contains Silver x5
      And Dave's deck contains Dame Natalie, Village
      And Ethelred's deck contains Mine
      And Fred's deck contains Copper
    Given my hand contains <knight>
      And Bob's hand contains Gold x5
      And Charlie's hand contains Moat, Gold x5
      And Charlie has setting Automoat on
      And Dave's hand contains Estate x2, Copper x2
    When I play <knight>
    Then the following 5 steps should happen at once
      Then I should have <actions> actions available
      And <extra verification>
      When the game checks actions        # for the Sir Michael case
      Then Bob should need to Choose a card to trash with <knight>
      And Dave should need to Choose a card to trash with <knight>
      And Ethelred should have trashed Mine from his deck
      And Fred should have discarded Copper from his deck
    And Bob should be revealing <Bob trash>, <Bob discard>
      And Dave should be revealing <Dave trash>, <Dave discard>
      And Charlie should be revealing nothing
      And Ethelred should be revealing nothing
      And Fred should be revealing nothing
    When Bob chooses his revealed <Bob trash> 
      And the game checks actions 
    Then the following 2 steps should happen at once
      Then Bob should have trashed <Bob trash> from his deck
      And Bob should have discarded <Bob keep> from his deck
    When Dave chooses his revealed <Dave trash> 
      And the game checks actions 
    Then the following 3 steps should happen at once
      Then Dave should have trashed <Dave trash> from his deck
      And Dave should have discarded <Dave keep> from his deck
      And <result>
  
    Examples:
      | knight         | actions |  extra verification                        | Bob trash | Bob keep  | Dave trash   | Dave keep    | result
      | Dame Josephine |    0    | I should have 0 cash available             | Dame Anna | Gold      | Dame Natalie | Village      | I should have trashed Dame Josephine from my play
      | Dame Molly     |    2    | I should have 2 actions available          | Dame Anna | Gold      | Dame Natalie | Village      | I should have trashed Dame Molly from my play
      | Dame Sylvia    |    0    | I should have 2 cash available             | Dame Anna | Gold      | Village      | Dame Natalie | I should have trashed Dame Sylvia from my play
      | Sir Bailey     |    1    | I should have drawn a card                 | Dame Anna | Gold      | Village      | Dame Natalie | I should have trashed Sir Bailey from my play
      | Sir Destry     |    0    | I should have drawn 2 cards                | Gold      | Dame Anna | Dame Natalie | Village      | I should have trashed Sir Destry from my play 
      | Sir Martin     |    0    | I should have 3 buys available             | Gold      | Dame Anna | Dame Natalie | Village      | I should have trashed Sir Martin from my play
      | Sir Michael    |    0    | Dave chooses to discard his Estate in hand | Gold      | Dame Anna | Village      | Dame Natalie | nothing should have happened
      | Sir Vander     |    0    | I should have 0 cash available             | Gold      | Dame Anna | Village      | Dame Natalie | nothing should have happened
  
  
  Scenario: Embargo on the pile affects all purchased Knights even with different names
    Given my hand contains Embargo, Gold
      And Bob's hand contains Embargo, Gold
      And Charlie's hand contains Gold x2
    When I play Embargo
      Then I should have trashed Embargo from my play
    When I choose the Knights pile
      And the game checks actions
    Then I should have 5 cash
      And it should be my Buy phase
    When I buy Dame Anna
      And the game checks actions
    Then the following 3 steps should happen at once
      Then I should have gained Curse
      And I should have discarded Gold from my play
      And I should have drawn 5 cards
    And it should be Bob's Play Action phase
    When Bob plays Embargo
      Then Bob should have trashed Embargo from his play
    When Bob chooses the Knights pile
      And the game checks actions
    Then Bob should have 5 cash
      And it should be Bob's Buy phase
    When Bob buys Dame Josephine
      And the game checks actions
    Then the following 3 steps should happen at once
      Then Bob should have gained Curse x2
      And Bob should have discarded Gold from his play
      And Bob should have drawn 5 cards
    And it should be Charlie's Play Action phase
    When Charlie stops playing actions
      And the game checks actions
    Then Charlie should have 6 cash
      And it should be Charlie's Buy phase
    When Charlie buys Dame Molly
      And the game checks actions
    Then the following 3 steps should happen at once
      Then Charlie should have gained Curse x2
      And Charlie should have discarded Gold from his play
      And Charlie should have drawn 5 cards

  Scenario: Contraband naming Knight at position #2 allows purchase of Knight #1 but not then #2
    Given my hand contains Contraband, Gold x3
    When I play Contraband
      Then Bob should need to Ban Alan from buying a card
      And Bob should be able to choose the Copper, Silver, Gold, Estate, Duchy, Province piles
      And Bob should be able to choose 'Dame Anna', 'Dame Josephine', 'Dame Molly', 'Dame Natalie', 'Dame Sylvia', 'Sir Bailey', 'Sir Destry', 'Sir Martin', 'Sir Michael', 'Sir Vander' for piles
    When Bob chooses 'Dame Josephine' for piles
      And the game checks actions
    Then I should have played Gold x3
      And it should be my Buy phase
      And I should have 12 cash
      And I should have 2 buys available
      And I should be able to choose the Knights pile
    When I buy Dame Anna
      Then I should have 7 cash
      And I should have 1 buy available
      And I should not be able to choose the Knights pile
      
    
  Scenario Outline: Wishing Well allows naming any Knight, even if the Knights pile is empty. Wishing Well naming one knight does not match another.
    Given my hand contains Wishing Well
      And my deck contains Copper, Dame Anna, Estate x10
      And the Knights pile contains <pile contents>
    When I play Wishing Well
      Then I should have drawn a card
      And I should need to Name a card, with Wishing Well
      And I should be able to choose the Copper, Silver, Gold, Estate, Duchy, Province piles
      And I should be able to choose 'Dame Anna', 'Dame Josephine', 'Dame Molly', 'Dame Natalie', 'Dame Sylvia', 'Sir Bailey', 'Sir Destry', 'Sir Martin', 'Sir Michael', 'Sir Vander' for piles
    When I choose <named card> for piles
      Then <result>
      
    Examples:
      | named card | result                                          | pile contents
      | Gold       | nothing should have happened                    | nothing
      | Sir Bailey | nothing should have happened                    | Sir Bailey, Sir Martin, Sir Vander
      | Dame Anna  | I should have moved Dame Anna from deck to hand | nothing
      | Dame Anna  | I should have moved Dame Anna from deck to hand | Dame Molly, Dame Natalie, Dame Sylvia

  Scenario: When Knights pile is empty, that counts towards game end
  
  Scenario: Knights pile does not get a Trade Route counter even with Dame Josephine on top
    Given I am a player in a standard game where the top card of the Knights pile is Dame Josephine
      Then the Knights pile should have no "trade route token" state  
  
  Scenario Outline: Dame Anna, 3/2 cards in hand
    Given my hand contains Dame Anna, <rest of hand>
      And Bob's deck contains Sir Bailey, Gold, Province
      And Charlie's deck contains Silver x5
      And Dave's deck contains Dame Natalie, Village, Village
    When I play Dame Anna
      Then I should need to Choose up to two cards to trash with Dame Anna
      And I should be able to choose <rest of hand> in hand
      And I should be able to choose a nil action in my hand
    When I choose <choice1> in my hand
      Then I should have trashed <choice1> from my hand
      And I should need to Choose up to one more card to trash with Dame Anna
      And I should be able to choose a nil action in my hand
    When I choose <choice2> in my hand
      And the game checks actions
    Then the following 3 steps should happen at once
      Then <result2>
      And Charlie should have trashed Silver from his deck
      And Charlie should have discarded Silver from his deck
    And Bob should need to Choose a card to trash with Dame Anna
      And Dave should need to Choose a card to trash with Dame Anna
      And Bob should be revealing Sir Bailey, Gold
      And Dave should be revealing Dame Natalie, Village
      
      Examples:
      rest of hand             | choice1 | choice2       | result2
      Copper, Estate, Province | Estate  | Copper        | I should have trashed Copper from my hand
      Curse, Platinum          | Curse   | Trash nothing | I should not need to act
    
  Scenario: Dame Anna, 1 card in hand
    Given my hand contains Dame Anna, Copper
      And Bob's deck contains Sir Bailey, Gold, Province
    When I play Dame Anna
      Then I should need to Choose up to two cards to trash with Dame Anna
    When I choose Copper in my hand
      And the game checks actions
      Then I should have trashed Copper from my hand
      And Bob should need to Choose a card to trash with Dame Anna
      
  Scenario: Dame Anna, 1 card in hand, decline to trash anything
    Given my hand contains Dame Anna, Copper
      And Bob's deck contains Sir Bailey, Gold, Province
    When I play Dame Anna
      Then I should need to Choose up to two cards to trash with Dame Anna
    When I choose Trash nothing in my hand
      And the game checks actions
    Then Bob should need to Choose a card to trash with Dame Anna
    
  Scenario: Dame Anna, 0 cards in hand
    Given my hand contains Dame Anna
      And Bob's deck contains Sir Bailey, Gold, Province
    When I play Dame Anna
      And the game checks actions
    Then Bob should need to Choose a card to trash with Dame Anna
    
  Scenario: Dame Josephine - Is a victory card, worth 2VP
    Given my hand contains Dame Josephine, Dame Molly, Dame Anna, Crossroads
      And my deck contains Copper x10
    When I play Crossroads
      Then I should have drawn a card
    When the game ends
      Then my score should be 2
  
  Scenario: Dame Natalie - Offers piles costing $3- but not $4+
    Given I am a player in a standard game with Knights, Village, Pawn
      And my hand contains Dame Natalie
      And Bob's deck contains Sir Bailey, Gold, Province
    When I play Dame Natalie
      Then I should need to Choose a card to gain with Dame Natalie
      And I should be able to choose the Estate, Copper, Silver, Village, Pawn piles
      And I should not be able to choose the Duchy, Province, Gold, Knights piles
      And I should be able to choose a nil action for piles
    When I choose the Village pile
      And the game checks actions
    Then I should have gained Village
    And Bob should need to Choose a card to trash with Dame Natalie
  
  Scenario Outline: Dame Natalie - After Highway, offers Sir Martin but not Sir Destry
    Given my hand contains Highway, Dame Natalie
      And my deck contains Bank
      And the Knights pile contains <contents>
    When I play Highway
      Then I should have drawn a card
    When I play Dame Natalie
      Then I should need to Choose a card to gain with Dame Natalie
      And I <should> be able to choose the Knights pile
    When I choose the <pile choice> pile
      And the game checks actions
    Then I should have gained <gained>
    
    Examples:
      | pile contents                      | should     | pile choice | gained
      | Sir Martin, Sir Bailey, Sir Vander | should     | Knights     | Sir Martin
      | Sir Destry, Dame Anna, Dame Molly  | should not | Silver      | Silver
      | nothing                            | should not | Estate      | Estate
  
  Scenario: Sir Vander - Trashing to Remodel
    Given my hand contains Remodel, Sir Vander
    When I play Remodel
      And the game checks actions
    Then I should have gained Gold
      And I should need to Take a replacement card with Remodel
  
  Scenario: Sir Vander - Trashing to another Knight attack
    Given my hand contains Sir Martin
      And Bob's deck contains Sir Vander, Estate
    When I play Sir Martin
      And the game checks actions
    Then the following 3 steps should happen at once
      Then Bob should have trashed Sir Vander from his deck
      And Bob should have discarded Estate from his deck
      And Bob should have gained Gold
      And I should have trashed Sir Martin from my play
    