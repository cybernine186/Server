sub EVENT_COMBAT {
	if ($combat_state == 1) {
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}

sub EVENT_SAY{
	if ($text=~/hail/i) {
		quest::say("Hail, $name. I am Deputy Budo Bullnose, the squad leader of the Great Wall Patrol. Be very careful in the lands beyond the wall. They are filled with dangerous beasts, as well as [Clan Runnyeye].");
	}
	if ($text=~/clan runnyeye/i) {
		quest::say("Beyond this wall lies Runnyeye, the lair of the goblins of Clan Runnyeye. They have been a nuisance to Rivervale for quite some time. If you wish to join the fight, go to Rivervale and ask Sheriff Roglio about Clan Runnyeye.");
	}
 	if ($text=~/I am reporting for duty/i) {
		quest::say("Stand tall then, Deputy $name. Your orders are to keep the creatures from venturing into the community of Rivervale and to kill many goblins. Check the goblin bodies, if you should find unbroken warrior beads on them, take them to Sheriff Roglio Bruth and should you be lucky enough to find a bizarre grappling device, you are to take it to Marshal Ghobber Truppack immediately! One more thing - should you defeat any orcs in battle, bring me their leather belts and I shall reward you for the great victory. May the power of Underfoot be with you!");
	}
}

sub EVENT_ITEM { 
	#:: Match a 13916 - Deathfist Slashed Belt
	if (plugin::takeItems(13916 => 1)) {
		quest::say("Grand work. Deputy $name! You will become a full-fledged deputy in no time. You should check in with Marshal Ghobber from time to time to see if you have earned your squad ring. Just go up to him and ask. 'Am I one with the Wall?' He will know, but you must first show your bravery in many battles against the goblins.");
		#:: Give a 13024 - Tagglefoot Tingle Drink
		quest::summonitem(13024);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 875 to 925cp
		my %cash = plugin::RandomCash(875,925);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Set factions
		quest::faction(263, 4);		#:: + Guardians of the Vale
		quest::faction(286, 4);		#:: + Mayor Gubbin
		quest::faction(355, 4);		#:: + Storm Reapers
		quest::faction(292, 4);		#:: + Merchants of Rivervale
		quest::faction(334, -10);	#:: - Dreadguard Outer
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
