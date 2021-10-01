sub EVENT_COMBAT {
	#:: Combat state true (enter combat)
	if ($combat_state == 1) {
		quest::say("Death to all!! None shall get the mallet!! All shall die!!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
