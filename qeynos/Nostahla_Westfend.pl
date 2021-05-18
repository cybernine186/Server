sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings..  I am Nostahla Westfend, understudy of Gahlith, and Second Master Wizard of the Order of Three.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 3
	if ($wp == 3) {
		#:: Sit down
		plugin::SetAnim("sit");
	}
	#:: Match waypoint 4
	elsif ($wp == 4) {
		#:: Stand up
		plugin::SetAnim("stand");
	}
	#:: Match waypoint 16
	elsif ($wp == 16) {
		quest::say("Gahlith, I'm going down to the docks to see if Ghul has anything new from overseas today. I'll be back in a little while.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
