sub EVENT_COMBAT {
	#:: combat state 1 = True
	if ($combat_state == 1) {
		my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::return_items(\%itemcount);
}

# Converted to Perl by SS
