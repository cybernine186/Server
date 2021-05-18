sub EVENT_COMBAT {
	#:: Combat state true (enter combat)
	if ($combat_state == 1) {
		quest::say("<Snort!!>.. For Meldrath!!");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("I die soon! Meldrath, help me!");
}
