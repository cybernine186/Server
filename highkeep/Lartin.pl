sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I have nothing to say to you! Move along!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint
	if ($wp == 5) {
		quest::say("You do not mind if I keep you company for a while, my good friend?");
		#:: Send a signal '1' to High Keep >> Guard_Folton (6003) with no delay
		quest::signalwith(6003, 1, 0);
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from /highkeep/Xentil_Herkanon.pl
	if ($signal == 1) {
		quest::depop();
	}
	#:: Match a signal '2' from /highkeep/Guard_Folton.pl
	elsif ($signal == 2) {
		quest::say("Very good of you.");
	}
}
