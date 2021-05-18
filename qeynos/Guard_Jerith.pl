sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Um, sorry, $name. I don't wish to be rude, but I must not be distracted while I am at my post. Commander Bayle trusted me with this watch and I will not let him down.");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from /qeynos/Lieutenant_Arathur.pl
	if ($signal == 1) {
		quest::say("Yes, sir!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
