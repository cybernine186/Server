sub EVENT_DEATH_COMPLETE {
	quest::say("The Dead shall avenge my death!");
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
