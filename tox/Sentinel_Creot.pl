sub EVENT_WAYPOINT_ARRIVE{
	if (($wp==1) || ($wp==3)) {
		quest::say("Hail citizens.  Sentinel Creot of the High Guard is on watch.");
	}
	if ($wp==1) {
		#:: Run!
		quest::SetRunning(1);
	}
	if ($wp==2) {
		#:: Walk.
		quest::SetRunning(0);
	}
}
