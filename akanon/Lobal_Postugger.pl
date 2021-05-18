sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello. I am the guild master.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
