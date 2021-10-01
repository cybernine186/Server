sub EVENT_SIGNAL {
	if ($signal == 1) {
		#:: Signal sent from qeynos/Lieutenant_Arathur.pl
		quest::say("Yes, sir!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
