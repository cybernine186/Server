sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/Lieutenant_Arathur.pl
	if ($signal == 1) {
		quest::say("Yes, sir!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
