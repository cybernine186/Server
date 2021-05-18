sub EVENT_WAYPOINT_ARRIVE{
     if ($wp == 30) {
          quest::say("Click.. Dust. Dust. Dust.");
     }
     elsif ($wp == 42) {
          quest::say("Click.. Dust. Dust. Dust.");
          quest::SetRunning(1);
     }
}
