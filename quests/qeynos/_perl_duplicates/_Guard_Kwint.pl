sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name! Are you new to Qeynos? If you are, I highly recommend stopping by the Lion's Mane Tavern for the best ale in Antonica. Oh, did I mention that my brother Earron is the master brewer there? Tell him [Kwint sent] you.");
	}
}

sub EVENT_COMBAT {
	if ($combat_state == 1) {
		my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 18821 - Scrap of Parchment
 	if (plugin::takeItems(18821 => 1)) {
		quest::say("Hey. Thanks! Sorry about that 'he's my brother' bit but I am sure you had a good time at the Lion's Mane anyway. I sure didn't lie to you about the quality of the ale there.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 5);		#:: + Guards of Qeynos
		quest::faction(219, 1);		#:: + Antonius Bayle
		quest::faction(230, -1);	#:: - Corrupt Qeynos Guards
		quest::faction(223, -1);	#:: - Circle of Unseen Hands
		quest::faction(291, 1);		#:: + Merchants of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(3500);
		#:: Create a hash for storing cash - 1 to 10cp
		my %cash = plugin::RandomCash(1,10);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
