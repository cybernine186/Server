sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Oooohhh... Arghhh... Yooouuu sssshhhalll neeeveer ffffiiinnnd the paaawwww..");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#::: When NPC arrives at waypoint 55 or 117
	if ($wp == 55 || $wp == 117) {
		quest::SetRunning(1);  #:: Run
	}
	#::: When NPC arrives at waypoint 82
	if ($wp == 82) {	
		quest::SetRunning(0);  #:: Walk
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("Aaaatt laaasssssstttt! Opolla's cuuurrsssee is lifted!");
}
