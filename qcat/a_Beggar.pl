sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Guards! Guards! Help me!!");
		quest::say("Guards! Guards! Help me!!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
