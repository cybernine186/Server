sub EVENT_ITEM {
	#:: Match a 12620 - Wanted Poster
	if (plugin::takeItems(12620 => 1)) {
		quest::say("Tis good that Jinkus sent you with this poster. There has been talk of a Northman fugitive in the city. Take this list back to Jinkus so that our brethren in Halas are aware of the many criminals who have fled Qeynos and are still at large.");
		#:: Give a 12622 - List of Qeynos Most Wanted
		quest::summonitem(12622);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(344, 1);			#:: + Beta Neutral
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
