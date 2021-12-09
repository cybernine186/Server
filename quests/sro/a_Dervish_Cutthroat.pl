sub EVENT_COMBAT {
	#:: Combat state 1 is entered combat
	if ($combat_state == 1) {
		#:: Create a scalar variable to store NPC race
		my $npcrace = $npc->GetRace();
		#:: Match race 54 - Orc
		if ($npcrace == 54) {
			quest::say("Orc stomp, orc kill - orc weapons, your blood will spill.");
		}
		else {
		my $cur_target = $npc->GetHateTop();
		if($cur_target) {
			my $target_name = $cur_target->GetCleanName();
			quest::say("Time to die $target_name!");
		}
		}
	}
}

sub EVENT_DEATH_COMPLETE {
	#:: Create a scalar variable to store NPC race
	my $npcrace = $npc->GetRace();
	#:: Match race 54 - Orc
	if ($npcrace == 54) {
		quest::say("My comrades will avenge my death.");
	}
}
