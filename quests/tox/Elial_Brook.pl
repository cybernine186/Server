sub EVENT_AGGRO {
	quest::say("That was not a very intelligent thing to do.");
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My comrades will avenge my death.");
}
