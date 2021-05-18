sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello. My name is Corun Finisc and I am one of the Jaggedpine Treefolk. It is our divine responsibility to watch over and protect Surefall Glade and its [inhabitants] from those who seek to [destroy] them.");
	}
	elsif ($text=~/inhabitants/i) {
		quest::say("The bears of Surefall Glade are our brothers. We are all children of [Tunare]. We would gladly die in their defense.");
	}
	elsif ($text=~/destroy/i) {
		quest::say("Poachers in seach of bear skins and gnolls who attack us unprovoked. We are doing all we can to stop them. May [Tunare] give me the strength needed to smite them dead with my [crook].");
	}
	elsif ($text=~/tunare/i) {
		quest::say("Tunare is the Mother of All. It is though Her will that we protect this land and its many creatures.");
	}
	elsif ($text=~/crook/i) {	
		quest::say("My crook? The Jaggedpine crook is an enchanted weapon of the Jaggedpine Treefolk. The [Sabertooths] take great pleasure in destroying the crooks of any Treefolk they manage to slay. If you were to recover the pieces of a broken crook, I would gladly mend it for you.");
	}
	elsif ($text=~/sabertooths/i) {
		quest::say("The Sabertooths are a vicious band of gnolls who live in Blackburrow, to the east of Surefall Glade. They constantly attack us when we only seek to share this land with them. They also send many patrols out into the Qeynos Hills to the south. We have even seen a Sabertooth skulking about in the caves behind Grizzly Falls. There is a [reward] for his hide.");
	}
	elsif ($text=~/reward/i) {
		quest::say("Yes. We are offering a small reward for slaying the skulking gnoll in the bear caves. Bring me his paw to claim your bounty. The Jaggedpine Treefolk remember well those who aid their cause.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13700 - Gnoll Paw
	if (plugin::takeItems(13700 => 1)) {
		quest::say("Thank you for tracking down the filthy little poacher. Take this as your reward.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(272, 5); 	#:: + Jaggedpine Treefolk
		quest::faction(302, 2); 	#:: + Protectors of Pine
		quest::faction(343, 1); 	#:: + QRG Protected Animals
		quest::faction(324, -2); 	#:: - Unkempt Druids
		quest::faction(262, 1); 	#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(1200);
		#:: Create a hash for storing cash - 550 to 700cp
		my %cash = plugin::RandomCash(550,700);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13231 - Bottom of Broken Staff and 13232 - Top of Broken Staff
	elsif (plugin::takeItems(13231 => 1, 13232 =>)) {
		quest::say("Excellent! Here is a Jaggedpine Crook of your own. Please use it only to defend yourself and never to attack one of Tunare's creatures. You will find that while wielding the crook, Tunare grants you a boon of strength and the power to smite enemies who would otherwise be impervious to physical attacks.");
		#:: Give a 13230 - Jaggedpine Crook
		quest::summonitem(13230);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(272, 10); 	#:: + Jaggedpine Treefolk
		quest::faction(302, 2); 	#:: + Protectors of Pine
		quest::faction(343, 1); 	#:: + QRG Protected Animals
		quest::faction(324, -2); 	#:: - Unkempt Druids
		quest::faction(262, 1); 	#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(200);
		#:: Create a hash for storing cash - 250 to 300cp
		my %cash = plugin::RandomCash(250,300);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_WAYPOINT_ARRIVE{
	if (($wp==3) || ($wp==18) || ($wp==29)) {
		quest::shout("Heed the wishes of Tunare and leave the bears of Surefall Glade undisturbed!");
	}
	elsif ($wp==11) {
		quest::say("By the will of Tunare, I serve this glade until I become one with it.");
	}
}
