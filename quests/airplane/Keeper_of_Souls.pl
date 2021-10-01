sub EVENT_SPAWN {
	#:: Create a timer 'keeper_depop' that triggers every 600 seconds (10 min)
	quest::settimer("keeper_depop", 600);
}

sub EVENT_TIMER {
	#:: Match a timer 'keeper_depop'
	if ($timer eq "keeper_depop") {
		quest::stoptimer("keeper_depop");
		quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
	#:: Key a data bucket
	$key = sirran_status;
	#:: Set a value of '4' for 900 seconds (15 min)
	quest::set_data($key, "4", 900);
	#:: Spawn one and only one The Plane of Sky >> Sirran_the_Lunatic (71058), without grid or guild war, at the current location
	quest::unique_spawn(71058, 0, 0, $x, $y, $z);
}
