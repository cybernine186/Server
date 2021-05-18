sub EVENT_COMBAT {
	#:: Match if combat is true (fighting)
	if ($combat_state == 1) {
		quest::say("Time to die $name.");
	}
}
