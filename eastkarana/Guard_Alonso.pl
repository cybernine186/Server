sub EVENT_COMBAT {
	#:: cobat state 1 = true
	if ($combat_state == 1) {
		quest::say("Time to die $name!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::return_items(\%itemcount);
}

# Converted to Perl by SS
