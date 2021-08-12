sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, thirsty adventurer! Please help yourself to the free salty snacks. We are here to serve you at the Lion's Main Tavern. Allow yourself to indulge from our wide selection oof fine spirits.");
	}
	elsif ($text=~/kwint/i) {
		quest::say("Kwint? Gave you the line about being my brother, huh? That boy sends me more customers, I tells ya! I give him one free drink for every person he gets to come in. Hey, could you do me a favor and take this voucher to him when you are done drinking? Thanks.");
		#:: Give a 18821 - Scrap of Parchment
		quest::summonitem(18821);
	}
}

sub EVENT_ITEM {
	#:: Match a 18821 - Scrap of Parchment
	if (plugin::takeItems(18821 => 1)) {
		quest::say("What the..? This voucher was for Kwint, not you! I will find someone more trustworthy to take it to him.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(291, -25);	#:: - Merchants of Qeynos
		quest::faction(223, 5);		#:: + Circle of Unseen Hands
		quest::faction(219, -3);	#:: - Antonius Bayle
		quest::faction(229, -2);	#:: - Coalition of Tradefolk
		quest::faction(262,-5);		#:: - Guards of Qeynos
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
