sub EVENT_COMBAT {
	#:: Combat state true (enter combat)
	if ($combat_state == 1) {
		quest::say("Areeeeewwwww");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
