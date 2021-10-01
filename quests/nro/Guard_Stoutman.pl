sub EVENT_COMBAT {
	#:: Match if combat state 1 (fighting)
	if ($combat_state == 1) {
		my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}
