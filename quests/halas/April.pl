sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello, $name. I'm a maker of weapon molds. Care to view my wares?");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
