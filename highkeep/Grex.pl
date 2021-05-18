sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I have nothing to say to you! Move along!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from /highkeep/Xentil_Herkanon.pl
	if ($signal == 1) {
		quest::depop();
	}
}
