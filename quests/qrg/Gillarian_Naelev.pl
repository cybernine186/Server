sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome, friend. Welcome to Surefall Glade. I need not remind you about [poaching], I hope");
	}
	elsif ($text=~/poaching/i) {
		quest::say("Poaching is illegal. We here are the Protectors of the Pine, rangers sworn to protect our land and all its inhabitants. This includes the wildlife. We spend a lot of time hunting poachers. If you want to [join the hunt], just let me know.");
	}
	elsif ($text=~/join the hunt/i) {
		quest::say("Very good, friend. Be on the lookout for poachers in Surefall Glade or Qeynos Hills, especially in the nearby caves. The poachers are not always human. Often times we find ourselves a Blackburrow gnoll or two. Bring me back their heads. Let's see how they look mounted above the mantle! Be on your way, then.");
	}
	elsif ($text=~/master poacher/i) {
		quest::say("'The master poacher is Talym Shoontar. If you wish to collect the bounty on this vile man, be sure to speak with our leader, Hager Sureshot. No doubt you will find him practicing his skills at the archery range.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13813 - Gnoll Head
	if (plugin::takeItems(13813 => 1)) {
		quest::say("Fantastic work!! Hager will be pleased. Not only do we rid ourself of a poacher, but we rid the land of these destructive gnolls. Our fletchers crafted this for me... Please take it as thanks.");
		#:: Give a 8803 - Rough Elm Recurve Bow
		quest::summonitem(8803);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(302, 15);	#:: + Protectors of Pine
		quest::faction(272, 6);		#:: + Jaggedpine Treefolk
		quest::faction(306, -3);	#:: - Sabertooths of Blackburrow
		quest::faction(262, 6);		#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(6000);
		#:: Create a hash for storing cash - 700 to 800cp
		my %cash = plugin::RandomCash(700,800);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13825 - Poacher's Head
	elsif (plugin::takeItems(13825 => 1)) {
		quest::say("Your deeds are great indeed. We shall cleanse our land of these poachers once and for all. A report has surfaced of a [master poacher].");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(302, 15);	#:: + Protectors of Pine
		quest::faction(272, 3);		#:: + Jaggedpine Treefolk
		quest::faction(306, -2);	#:: - Sabertooths of Blackburrow
		quest::faction(262, 3);		#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(6000);
		#:: Create a hash for storing cash - 400 to 500cp
		my %cash = plugin::RandomCash(400,500);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
