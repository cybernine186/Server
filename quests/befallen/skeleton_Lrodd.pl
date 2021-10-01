sub EVENT_COMBAT {
	#:: Combat state true (enter combat)
	if ($combat_state == 1) {
		quest::say("Run!! Leave this place at once!!");
	}
}

sub EVENT_ITEM {
	#:: Match a 18891 - Tattered Cloth Note (Note to Hubard L'rodd)
	if (plugin::takeItems(18891 => 1)) {
		quest::say("Search!! Find Windstream. Find the mallet!! One. Two. Three.");
		# Spawn Befallen >> Cmdr_Windstream (36096)
		quest::spawn2(36096, 0, 0, -88, -637, -66, 127);
		#:: Ding!
		quest::ding();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
