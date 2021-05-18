sub EVENT_SPAWN {
	quest::shout("A loud roar is heard within the woods!!");
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
