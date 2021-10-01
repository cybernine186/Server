sub EVENT_COMBAT {
	#:: Combat state true (enter combat)
	if ($combat_state == 1) {
		quest::say("I shall show you the pure fury of the Dead!!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("Soon you shall learn the extent of the Dead's power. Vengeance shall be theirs.");
}
