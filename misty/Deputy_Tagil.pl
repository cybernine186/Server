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
	#:: Match a 18013 - Note
	if (plugin::takeItems(18013 => 1)) {
		quest::say("What's this? Oh dear. I am very sorry. Please take this to Uner with my apologies.");
		#:: Give a 13240 - Deputy Tagil's Payment
		quest::summonitem(13240);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
