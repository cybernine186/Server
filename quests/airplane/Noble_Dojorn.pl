sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Bladestorms! Remove these trespassers from my island!!");
	}
}

sub EVENT_DEATH_COMPLETE {
	#:: Spawn a The Plane of Sky >> Overseer_of_Air (71034), with no grid or guild war, at the specified location
	quest::spawn2(71034, 0, 0, -540.6, 767.1, 174.1, 65);
}
