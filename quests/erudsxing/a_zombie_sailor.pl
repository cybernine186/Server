sub EVENT_SPAWN {
	#:: SetEntityVariable variable_name, variable_value
	plugin::SEV($npc, "hasmap", 0);
	#:: Set local loot chance for 13423 - Blurred Map at 3.5%
	$roll = plugin::RandomRange(1,200);
	if ($roll <= 7) {
		#:: Add to loot 13423 - Blurred Map
		quest::addloot(13423, 1, 0);
		#:: Update Entity Variable
		plugin::SEV($npc, "hasmap", 1);
	}
}

sub EVENT_COMBAT {
	#:: ReadEntityVariable entity, variable_name
	$myhasmap=plugin::REV($npc, "hasmap");
	#:: Match if the entity has 13423 - Blurred Map and enters combat
	if ($myhasmap && $combat_state == 1) {
		quest::say("Join.. Glug.. Tombor in his.. watery grave!!");
		$classplural = "${class}s";
		quest::say("$classplural like you always bring out the worst in me.");
	}
}

sub EVENT_DEATH_COMPLETE {
	#:: ReadEntityVariable entity, variable_name
	$myhasmap = plugin::REV($npc, "hasmap");
	#:: Match if the entity has 13423 - Blurred Map
	if ($myhasmap) {
		quest::say("My map!! You have my.. map.");
	}
}
