sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello $name. I am Nug Rellash, assistant brewer and barkeep at the Lion's Mane Tavern. Come in and enjoy the drinks.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18821 - Scrap of Parchment
	if (plugin::takeItems(18821 => 1)) {
		#:: Made up.
		quest::say("What the..? This voucher was for Kwint, not you! We will find someone more trustworthy to take it to him.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(291, -5);	#:: - Merchants of Qeynos
		quest::faction(223, 1);		#:: + Circle of Unseen Hands
		quest::faction(219, -1);	#:: - Antonius Bayle
		quest::faction(229, -1);	#:: - Coalition of Tradefolk
		quest::faction(262,-1);		#:: - Guards of Qeynos
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
