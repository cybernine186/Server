sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name. I am Vesteri Namanoi. I provide training to the Jaggedpine Treefolk and their allies. If you are not busy, I would like to ask a small [favor] of you.");
	}
	elsif ($text=~/favor/i) {
		quest::say("I need you to take this claim check to Qeynos for me. Nesiff Talaherd is a woodcarver who owns a shop in South Qeynos. I am having him carve a small statue of Tunare for Te'Anara. With my training schedule, I can not make the journey to Qeynos. Please give this claim check to Nesiff and bring the statue to me. It is a surprise, so please do not say anything to Te'Anara about it.");
		#:: Give a 18012 - Claim Check
		quest::summonitem(18012);
	}
}

sub EVENT_ITEM {
	#:: Match a 13864 - Wooden Statue
	if (plugin::takeItems(13864 => 1)) {
		quest::say("Oh thank you so much! Here. Take this reward for your time. I will also tell Te'Anara of you.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(272, 5);		#:: + Jaggedpine Treefolk
		quest::faction(302, 1);		#:: + Protectors of Pine
		quest::faction(343, 1);		#:: + QRG Protected Animals
		quest::faction(324, -1);	#:: - Unkempt Druids
		quest::faction(262, 1);		#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(250);
		#:: Create a hash for storing cash - 200 to 250cp
		my %cash = plugin::RandomCash(200,250);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
