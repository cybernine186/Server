sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I have no time to talk, citizen. Please, step aside!");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 14
	if ($wp == 14) {
		quest::say("Sir. You called for me?");
		#:: Send a signal "1" to South Qeynos >> Captain_Tillin (1068) with no delay
		quest::signalwith(1068,1,0);
	}
	#:: Match waypoint 40
	elsif ($wp == 40) {
		quest::say("McNeal Jocub? You have been found guilty of crimes against the city of Qeynos.");
	}
	#:: Match waypoint 41
	elsif ($wp == 41) {
		#:: Send a signal "1" to South Qeynos >> McNeal_Jocub (1099) with no delay
		quest::signalwith(1099,1,0);
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Captain_Tillin.pl
	if ($signal == 1) {
		quest::say("Aye sir!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
