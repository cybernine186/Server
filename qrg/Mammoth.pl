sub EVENT_ITEM {
	#:: Turn in for 12140 - Regurgitonic
	if (plugin::takeItems(12140 => 1)) {
		#:: Give a 18809 - Bayle List II
		quest::summonitem(18809);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(343, 10);		#:: + QRG Protected Animals
		quest::faction(302, 10);		#:: + Protectors of Pine
		quest::faction(272, 10);		#:: + Jaggedpine Treefolk
		quest::faction(366, -30);		#:: - Karana Bandits
		#:: Grant a small amount of experience
		quest::exp(200);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
