sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail!  Keep all combat to the center of the ring. So says [Ebon Strongbear].");
	}
	elsif ($text=~/ebon strongbear/i) {
		quest::say("Ebon Strongbear is the current champion of the Steel Warriors. As champion, he rules over the Steel Warriors.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
