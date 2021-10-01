sub EVENT_WAYPOINT_ARRIVE{
	#:: Match waypoint 2, 4, and 6
	if(($wp==2) || ($wp==4) || ($wp==6)){
		quest::say("condition report soldier!");
		#:: Send a signal "1" to East Commonlands >> Guard_Reskin (22066) with a one second delay
		quest::signalwith(22066,1,1);
	}
	#:: Match waypoint 3 and waypoint 7
	elsif(($wp==3) || ($wp==7)){
		quest::say("condition report soldier!");
		#:: Send a signal "1" to East Commonlands >> Guard_Tolus (22035) with a one second delay
		quest::signalwith(22035,1,1);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
