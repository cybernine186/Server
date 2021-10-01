sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, small one! I am Xanuusus of the Stormreapers. You are welcome to rest beneath my mighty branches.");
	}
}

sub EVENT_ITEM {
	#:: Turn in for 13411 - Case of Jumjum Juice
	if (plugin::takeItems(13411 => 1 )) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Heh heh! Excellent, small one!  My roots have been longing for some fresh jumjum juice!  Thank you!  Take this for your trouble.  Be sure to thank the Tagglefoots for me.");
			#:: Give a random reward: 13977 - carrot, 84004 - fishing pole, or 13083 - pine needles
			quest::summonitem(quest::ChooseRandom(13977,84004,13083));
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(355, 10);		#:: + Storm Reapers
			quest::faction(286, 1);			#:: + Mayor Gubbin
			quest::faction(292, 1);			#:: + Merchants of Rivervale
			quest::faction(329, -1);		#:: - Unkempt Druids
			#:: Grant a small amount of experience
			$client->AddLevelBasedExp(4, 5);
			#:: Create a hash for storing cash - 70 to 90cp
			my %cash = plugin::RandomCash(70,90);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			quest::emote("will not accept this item.");
			#:: Return a 13411 - Case of Jumjum Juice
			quest::summonitem(13411);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
