sub EVENT_COMBAT {
	#:: Match if combat state 1 (fighting)
	if ($combat_state == 1) {
		quest::say("Time to die $name!");
	}
}
