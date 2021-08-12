sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Buy something!!  This is no tavern!  I am not selling conversation!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
