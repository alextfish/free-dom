card_dict = {"BaseGame::Cellar":"Action (cost: 2) - +1 Action. Discard any number of cards. Draw 1 card per card discarded.","BaseGame::Chapel":"Action (cost: 2) - Trash up to 4 cards from your hand.","BaseGame::Moat":"Action (Reaction; cost: 2) - Draw 2 cards. When another player plays an Attack card, you may reveal this from your hand. If you do, you are unaffected by that Attack.","BaseGame::Chancellor":"Action (cost: 3) - +2 Cash. You may immediately put your deck into your discard pile.","BaseGame::Village":"Action (cost: 3) - Draw 1 card, +2 Actions.","BaseGame::Woodcutter":"Action (cost: 3) - +1 Buy, +2 Cash.","BaseGame::Workshop":"Action (cost: 3) - Gain a card costing up to 4.","BaseGame::Feast":"Action (cost: 4) - Trash this card. Gain a card costing up to 5.","BaseGame::Bureaucrat":"Action (Attack; cost: 4) - Gain a Silver card; put it on top of your deck. Each other player reveals a Victory card from his or her hand and puts it on top of their deck, or reveals a hand with no Victory cards.","BaseGame::Gardens":"Victory (cost: 4) - Worth 1 point for every 10 cards in your deck (rounded down).","BaseGame::Militia":"Action (Attack; cost: 4) - +2 cash. Each other player discards down to 3 cards.","BaseGame::Moneylender":"Action (cost: 4) - Trash a Copper card from your hand. If you do, +3 cash.","BaseGame::ThroneRoom":"Action (cost: 4) - Choose an Action card in hand. Play it twice.","BaseGame::Smithy":"Action (cost: 4) - Draw 3 cards.","BaseGame::Spy":"Action (Attack; cost 4) - Draw 1 card, +1 Action. Each player (including you) reveals the top card of his or her deck and either discards it or puts it back, your choice.","BaseGame::Thief":"Action (Attack; cost: 4) - Each other player reveals the top two cards of his deck. If they revealed any Treasure cards, they trash one of them that you choose. You may gain any or all of the trashed cards. They discard the other revealed cards.","BaseGame::Remodel":"Action (cost: 4) - Trash a card from your hand. Gain a card costing up to 2 more than the trashed card.","BaseGame::CouncilRoom":"Action (cost: 5) - Draw 4 cards, +1 Buy. Each other player draws a card.","BaseGame::Festival":"Action (cost: 5) - +2 Actions, +1 Buy, +2 Cash.","BaseGame::Laboratory":"Action (cost: 5) - Draw 2 cards, +1 Action.","BaseGame::Library":"Action (cost: 5) - Draw until you have 7 cards in hand. You may set aside any Action cards you draw this way, as you draw them; discard the set-aside cards after you finish drawing.","BaseGame::Witch":"Action (Attack; cost: 5) - Draw 2 cards. Each other player gains a Curse card.","BaseGame::Mine":"Action (cost: 5) - Trash a Treasure card from your hand. Gain a Treasure card costing up to 3 more, and put it into your hand.","BaseGame::Market":"Action (cost: 5) - Draw 1 card, +1 Action, +1 Buy, +1 Cash.","BaseGame::Adventurer":"Action (cost: 6) - Reveal cards from your deck until you reveal two Treasure cards. Put those Treasure cards into your hand, and discard the other revealed cards.","Intrigue::Courtyard":"Action (cost: 2) - Draw 3 cards. Put a card from your hand on top of your deck.","Intrigue::Pawn":"Action (cost: 2) - Choose two: Draw 1 card; +1 Action; +1 Buy; +1 Cash.","Intrigue::SecretChamber":"Action (Reaction; cost: 2) - Discard any number of cards; +1 Cash per card discarded. When another player plays an Attack card, you may reveal this from your hand. If you do, draw 2 cards, then put 2 cards from your hand on top of your deck.","Intrigue::Masquerade":"Action (cost: 3) - Draw 2 cards. Each player passes a card from his or her hand to the left at once. Then you may trash a card from your hand. (This is not an Attack)","Intrigue::GreatHall":"Action/Victory (cost: 3) - Draw 1 card, +1 Action. / 1 point.","Intrigue::ShantyTown":"Action (cost: 3) - +2 Actions. Reveal your hand. If you have no Action cards in hand, draw 2 cards.","Intrigue::Steward":"Action (cost: 3) - Choose one: Draw 2 cards; or +2 cash; or trash 2 cards from your hand.","Intrigue::WishingWell":"Action(cost: 3) - Draw 1 card, +1 Action. Name a card, then reveal the top card of your deck. If it's the named card, put it into your hand.","Intrigue::Swindler":"Action (Attack; cost: 3) - +2 Cash. Each other player trashes the top card of his or her deck, and gains a card with the same cost of your choice.","Intrigue::Baron":"Action (cost: 4) - +1 Buy. You may discard an Estate card. If you do, +4 cash; otherwise, gain an Estate.","Intrigue::Bridge":"Action (cost: 4) - +1 Buy, +1 Cash. All cards cost 1 less this turn, but not less than 0.","Intrigue::Conspirator":"Action (cost: 4) - +2 Cash. If you've played 3 or more Actions this turn, +1 Action, draw 1 card.","Intrigue::Scout":"Action (cost: 4) - +1 Action. Reveal the top 4 cards of your deck. Put the revealed Victory cards into your hand. Put the other cards on top of your deck in any order.","Intrigue::Ironworks":"Action (cost: 4) - Gain a card costing up to 4. If it's an: Action => +1 Action; Treasure => +1 Cash; Victory => Draw 1 card.","Intrigue::MiningVillage":"Action (cost: 4) - Draw 1 card, +2 Actions. You may trash this card immediately; if you do, +2 cash.","Intrigue::Coppersmith":"Action (cost: 4) - Copper produces an extra 1 cash this turn.","Intrigue::Duke":"Victory (cost: 5) - 1 point per Duchy in your deck.","Intrigue::Minion":"Action (Attack; cost: 5) - +1 Action. Choose one: +2 cash; or discard your hand and draw 4 cards, and each other player with 5 or more cards in hand discards his hand and draws 4.","Intrigue::Saboteur":"Action (Attack; cost: 5) - Each other player reveals cards from the top of his deck until he reveals one costing 3 or more. He trashes that card and may gain a card costing at most 2 less than it. He discards the other revealed cards.","Intrigue::Torturer":"Action (Attack; cost: 5) - Draw 3 cards. Each other player chooses: he discards 2 cards, or he gains a Curse card into his hand.","Intrigue::Upgrade":"Action (cost: 5) - Draw 1 card, +1 Action. Trash a card from your hand. Gain a card costing exactly 1 more than it.","Intrigue::Tribute":"Action (cost: 5) - The player to your left discards the top 2 cards of his deck. For each differently-named card discarded, if it's an Action, +2 Actions; Treasure, +2 Cash; Victory, draw 2 cards.","Intrigue::TradingPost":"Action (cost: 5) - Trash 2 cards from your hand. If you do, gain a Silver card to your hand.","Intrigue::Harem":"Treasure/Victory (cost: 6) - 2 Cash / 2 points","Intrigue::Nobles":"Action/Victory (cost: 6) - Choose one: Draw 3 cards, or +2 Actions. / 2 points","Seaside::Embargo":"Action (cost: 2) - +2 Cash. Trash this card. Put an Embargo token on top of a Supply pile. When a player buys a card, he gains a Curse card per Embargo token on that pile.","Seaside::Haven":"Action (Duration; cost: 2) - Draw 1 Card, +1 Action. Set aside a card from your hand face down. At the start of your next turn, put it into your hand.","Seaside::Lighthouse":"Action (Duration; cost: 2) - +1 Action. Now and at the start of your next turn: +1 Cash. - While this is in play, when another player plays an Attack card, it doesn't affect you.","Seaside::NativeVillage":"Action (cost: 2) - +2 Actions. Choose one: Set aside the top card of your deck face down on your Native Village mat; or put all the cards from your mat into your hand.","Seaside::PearlDiver":"Action (cost: 2) - Draw 1 card, +1 Action. Look at the bottom card of your deck. You may put it on top.","Seaside::Ambassador":"Action (Attack; cost: 3) - Reveal a card from your hand. Return up to 2 copies of it from your hand to the Supply. Then each other player gains a copy of it.","Seaside::FishingVillage":"Action (Duration; cost: 3) - +2 Actions, +1 Cash. At the start of your next turn: +1 Action, +1 Cash.","Seaside::Lookout":"Action (cost: 3) - +1 Action. Look at the top 3 cards of your deck. Trash one of them. Discard one of them. Put the other one on top of your deck.","Seaside::Warehouse":"Action (cost: 3) - Draw 3 cards, +1 Action. Discard 3 cards.","Seaside::Smuggler":"Action (cost: 3) - Gain a copy of a card costing up to 6 Cash that the player to your right gained on his last turn.","Seaside::Caravan":"Action (Duration; cost: 4) - Draw 1 card, +1 Action. At the start of your next turn, draw 1 card.","Seaside::Cutpurse":"Action (Attack; cost: 4) - +2 Cash. Each other player discards a Copper card (or reveals a hand with no Copper).","Seaside::Island":"Action/Victory (cost: 4) - Set aside this and another card from your hand. Return them to your deck at the end of the game. / 2 points.","Seaside::TreasureMap":"Action (cost: 4) - Trash this and another copy of Treasure Map from your hand. If you do trash two Treasure Maps, gain 4 Gold cards, putting them on top of your deck.","Seaside::PirateShip":"Action (Attack; cost: 4) - Choose one: Each other player reveals the top 2 cards of his deck, trashes a revealed Treasure that you choose, discards the rest, and if anyone trashed a Treasure you take a Coin token; or +1 Cash per Coin token you've taken with Pirate Ships this game.","Seaside::Salvager":"Action (cost: 4) - +1 Buy. Trash a card from your hand. +Cash equal to its cost.","Seaside::SeaHag":"Action (Attack; cost: 4) - Each other player discards the top card of his deck, then gains a Curse card, putting it on top of his deck.","Seaside::Navigator":"Action (cost: 4) - +2 Cash. Look at the top 5 cards of your deck. Either discard all of them, or put them back on top of your deck in any order.","Seaside::Bazaar":"Action (cost: 5) - Draw 1 card, +2 Actions, +1 Cash.","Seaside::Explorer":"Action (cost: 5) - You may reveal a Province card from your hand. If you do, gain a Gold card, putting it into your hand. Otherwise, gain a Silver card, putting it into your hand.","Seaside::GhostShip":"Action (Attack; cost: 5) - Draw 2 cards. Each other player with 4 or more cards in hand puts cards from his hand on top of his deck until he has 3 cards in his hand.","Seaside::MerchantShip":"Action (Duration; cost: 5) - Now and at the start of your next turn: +2 Cash.","Seaside::Outpost":"Action (Duration; cost: 5) - You only draw 3 cards (instead of 5) in this turn's Clean-up phase. Take an extra turn after this one. This can't cause you to take more than two consecutive turns.","Seaside::Tactician":"Action (Duration; Cost: 5) - Discard your hand. If you discarded any cards this way, then at the start of your next turn, +5 Cards, +1 Buy, and +1 Action.","Seaside::Treasury":"Action (cost: 5) - Draw 1 card, +1 Action, +1 Cash. When you discard this from play, if you didn't buy a Victory card this turn, you may put this on top of your deck.","Seaside::Wharf":"Action (Duration; cost: 5) - Now and at the start of your next turn: draw 2 Cards, +1 Buy.","Prosperity::Loan":"Treasure (cost: 3) - 1 Cash. When you play this, reveal cards from your deck until you reveal a Treasure. Discard it or trash it. Discard the other cards.","Prosperity::TradeRoute":"Action (cost: 3) - +1 Buy. +1 Cash per token on the Trade Route mat. Trash a card from your hand. / Setup: Put a token on each Victory card Supply pile. When a card is gained from that pile, move the token to the Trade Route mat.","Prosperity::Watchtower":"Action (Reaction; cost: 3) - Draw until you have 6 cards in hand. / When you gain a card, you may reveal this from your hand. If you do, either trash that card, or put it on top of your deck.","Prosperity::Monument":"Action (cost: 4) - +2 Cash, +1 VP","Prosperity::Bishop":"Action (cost: 4) +1 Cash, +1 VP. Trash a card from your hand. +VP equal to half its cost in coins, rounded down. Each other player may trash a card from his hand.","Prosperity::Quarry":"Treasure (cost: 4) - 1 Cash. While this is in play, Action cards cost 2 less, but not less than 0.","Prosperity::Talisman":"Treasure (cost: 4) - 1 Cash. While this is in play, when you buy a card costing 4 or less that is not a Victory card, gain a copy of it.","Prosperity::WorkersVillage":"Action (cost: 4) - Draw 1 card, +2 Actions, +1 Buy","Prosperity::City":"Action (Cost: 5) - Draw 1 card, +2 Actions. If there are one or more empty Supply piles, draw another card. If there are two or more, +1 Cash and +1 Buy.","Prosperity::Contraband":"Treasure (Cost: 5) - 3 Cash, +1 Buy. When you play this, the next player names a card. You can't buy that card this turn.","Prosperity::CountingHouse":"Action (Cost: 5) - Look through your discard pile, reveal any number of Copper cards from it, and put them into your hand.","Prosperity::Mint":"Action (cost: 5) - You may reveal a Treasure card from your hand. Gain a copy of it. / When you buy this, trash all Treasures you have in play.","Prosperity::Mountebank":"Action (Attack; cost: 5) - +2 Cash. Each other player may discard a Curse. If he doesn't, he gains a Curse and a Copper.","Prosperity::Venture":"Treasure (cost: 5) - 1 Cash. When you play this, reveal cards from your deck until you reveal a Treasure. Discard the other cards. Play that Treasure","Prosperity::RoyalSeal":"Treasure (cost: 5) - 2 Cash. While this is in play, when you gain a card, you may put that card on top of your deck.","Prosperity::Vault":"Action (cost: 5) - Draw 2 Cards. Discard any number of cards; +1 cash per card discarded. Each other player may discard 2 cards; if he does, he draws a card.","Prosperity::Rabble":"Action (Attack; cost: 5) - Draw 3 Cards. Each other player reveals the top 3 cards of his deck, discards the revealed Actions and Treasures, and puts the rest back on top in any order.","Prosperity::Goons":"Action (Attack; cost: 6) - +1 Buy, +2 Cash. Each other player discards down to 3 cards. / While this is in play, when you buy a card, +1 VP","Prosperity::GrandMarket":"Action (cost: 6) - Draw 1 Card, +1 Action, +1 Buy, +2 Cash. / You can't buy this if you have any Copper in play.","Prosperity::Hoard":"Treasure (cost: 6) - 2 Cash. / While this is in play, when you buy a Victory card, gain a Gold.","Prosperity::Bank":"Treasure (cost: 7) - When you play this, it's worth 1 Cash per Treasure card you have in play (including this).","Prosperity::Expand":"Action (cost: 7) - Trash a card from your hand. Gain a card costing up to 3 more than the trashed card.","Prosperity::KingsCourt":"Action (cost: 7) - You may choose an Action card in you hand. Play it three times","Prosperity::Forge":"Action (cost: 7) - Trash any number of cards from your hand. Gain a card with cost exactly equal to the total cash cost of the trashed cards.","Prosperity::Peddler":"Action (cost: 8) - Draw a card, +1 Action, +1 Cash. / During your Buy phase, this costs 2 less per Action card you have in play, but not less than 0.","Prosperity::Platinum":"Treasure (cost: 9) - 5 cash","Prosperity::Colony":"Victory (cost: 11) - 10 points","Hinterlands::Crossroads":"Action (cost: 2) - Reveal your hand. Draw 1 card per Victory card revealed. If this is the first time you played a Crossroads this turn, +3 Actions.","Hinterlands::Duchess":"Action (cost: 2) - +2 Cash. Each player (including you) looks at the top card of his deck, and discards it or puts it back. / When you gain a Duchy, you may gain a Duchess.","Hinterlands::FoolsGold":"Treasure (Reaction; cost: 2) - If this is the first time you played a Fools Gold this turn, this is worth 1 cash, otherwise it's worth 4 cash. / When another player gains a Province, you may trash this from your hand. If you do, gain a Gold, putting it on your deck.","Hinterlands::Develop":"Action (cost: 2) - Trash a card from your hand. Gain a card costing exactly 1 more than it and a card costing exactly 1 less than it, in either order, putting them on top of your deck.","Hinterlands::Oasis":"Action (cost: 3) - Draw 1 card, +1 Action, +1 Cash. Discard a card.","Hinterlands::Oracle":"Action (Attack; cost: 3) - Each player (including you) reveals the top 2 cards of his deck, and you choose one: either he discards them, or he puts them back on top in an order he chooses. Draw 2 cards.","Hinterlands::Tunnel":"Reaction/Victory (cost: 3) - When you discard this other than during a Clean-up phase, you may reveal it. If you do, gain a Gold. / 2 points","Hinterlands::Scheme":"Action (cost: 3) - Draw 1 card, +1 Action. At the start of Clean-up this turn, you may choose an Action card you have in play. If you discard it from play this turn, put it on your deck.","Hinterlands::JackOfAllTrades":"Action (cost: 4) - Gain a Silver. Look at the top card of your deck; discard it or put it back. Draw until you have 5 cards in hand. You may trash a card from your hand that is not a Treasure.","Hinterlands::NobleBrigand":"Action (Attack; cost: 4) - +1 Cash / When you buy this or play it, each other player reveals the  top 2 cards of his deck, trashes a revealed Silver or Gold you choose, and discards the rest. If he didn't reveal a Treasure, he gains a Copper. You gain the trashed cards.","Hinterlands::NomadCamp":"Action (cost: 4) - +1 Buy, +2 Cash / When you gain this, put it on top of your deck.","Hinterlands::Trader":"Action (Reaction; cost: 4) - Trash a card from your hand. Gain a number of Silvers equal to its cost in coins / When you would gain a card, you may reveal this from your hand. If you do, instead gain a Silver.","Hinterlands::SpiceMerchant":"Action (cost: 4) - You may trash a Treasure from your hand. If you do, choose one: Draw 2 cards, +1 Action; or +2 cash, +1 Buy","Hinterlands::SilkRoad":"Victory (cost: 4) - Worth 1 point for every 4 Victory cards in your deck (round down).","Hinterlands::Cache":"Treasure (cost: 5) - 3 Cash. When you gain this, gain two Coppers.","Hinterlands::Cartographer":"Action (cost: 5) - Draw 1 card, +1 Action. Look at the top 4 cards of your deck. Discard any number of them. Put the rest back on top in any order.","Hinterlands::Embassy":"Action (costs: 5) - Draw 5 cards. Discard 3 cards. / When you gain this, each other player gains a Silver.","Hinterlands::Haggler":"Action (costs: 5) - +2 Cash. / While this is in play, when you buy a card, gain a card costing less than it that is not a Victory card.","Hinterlands::IllGottenGains":"Treasure (costs: 5) - 1 Cash. When you play this, you may gain a Copper, putting it into your hand. / When you gain this, each other player gains a Curse.","Hinterlands::Highway":"Action (costs: 5) - Draw 1 card, +1 Action. / While this is in play, cards cost 1 cash less, but not less than 0.","Hinterlands::BorderVillage":"Action (cost: 6) - Draw 1 card, +2 Actions. / When you gain this, gain a card costing less than this.","Hinterlands::Farmland":"Victory (cost: 6) - 2 points. / When you buy this, trash a card from your hand. Gain a card costing exactly 2 more than the trashed card.","BasicCards::Estate":"Victory (cost: 2) - 1 point","BasicCards::Duchy":"Victory (cost: 5) - 3 points","BasicCards::Province":"Victory (cost: 8) - 6 points","BasicCards::Curse":"Curse (cost: 0) - -1 points","BasicCards::Copper":"Treasure (cost: 0) - 1 cash","BasicCards::Silver":"Treasure (cost: 3) - 2 cash","BasicCards::Gold":"Treasure (cost: 6) - 3 cash"}