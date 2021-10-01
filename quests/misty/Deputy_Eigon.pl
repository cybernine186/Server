sub EVENT_COMBAT {
	if ($combat_state == 1) {
		my $cur_target = $npc->GetHateTop();
		if ($cur_target) {
			my $target_name = $cur_target->GetCleanName();
			quest::say("Time to die $target_name!");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 16165 - Sack of Turnips
	if (plugin::takeItems(16165 => 1)){
		quest::say("Daleen sent you? She is so sweet. If she wasn't married.. ehem.. Thanks.");
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 90 to 120cp
		my %cash = plugin::RandomCash(90,120);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Set factions
		quest::faction(263, 5);		#:: + Guardians of the Vale
		quest::faction(286, 1);		#:: + Mayor Gubbin
		quest::faction(355, 1);		#:: + Storm Reapers
		quest::faction(292, 1);		#:: + Merchants of Rivervale
		quest::faction(334, -1);		#:: - Dreadguard Outer
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
