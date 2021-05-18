sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I'm Captain Bosec, and I am the officer in charge down here. It's my job to patrol the prison and try to keep any [goblins] from getting into Highpass.");
	}
	elsif ($text=~/goblins/i) {
		quest::say("Help us exterminate these vile creatures. They call themselves the [Pickclaw] Clan.. I call them annoying. I will gladly pay big money for the left ear of every goblin slain.");
	}
	elsif ($text=~/pickclaw/i) {
		quest::say("A couple of months ago, Carson decided to add some more floors beneath the keep. During the construction, we came across these tunnels.. and these goblins. Work has been temporarily halted until we can completely clear out this Pickclaw infestation.");
	}
}

sub EVENT_ITEM {
	#:: Match four 13790 - Left Goblin Ear
	if (plugin::takeItems(13790 => 4)) {
		quest::say("Well done! We could really use the extra help around here.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(332, 8);		#:: + Highpass Guards
		quest::faction(329, 4);		#:: + Carson McCabe
		quest::faction(331, 4);		#:: + Merchants of Highpass
		quest::faction(230, 4);		#:: + Corrupt Qeynos Guards
		quest::faction(330, 4);		#:: + The Freeport Militia
		#:: Grant a small amount of experience, based on level
		$client->AddLevelBasedExp(4, 24);
		#:: Create a hash for storing cash - 2400 to 2800cp
		my %cash = plugin::RandomCash(2400,2800);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match three 13790 - Left Goblin Ear
	elsif (plugin::takeItems(13790 => 3)) {
		quest::say("Well done! We could really use the extra help around here.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(332, 6);		#:: + Highpass Guards
		quest::faction(329, 3);		#:: + Carson McCabe
		quest::faction(331, 3);		#:: + Merchants of Highpass
		quest::faction(230, 3);		#:: + Corrupt Qeynos Guards
		quest::faction(330, 3);		#:: + The Freeport Militia
		#:: Grant a small amount of experience, based on level
		$client->AddLevelBasedExp(3, 24);
		#:: Create a hash for storing cash - 1800 to 2100cp
		my %cash = plugin::RandomCash(1800,2100);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match two 13790 - Left Goblin Ear
	elsif (plugin::takeItems(13790 => 2)) {
		quest::say("Well done! We could really use the extra help around here.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(332, 4);		#:: + Highpass Guards
		quest::faction(329, 2);		#:: + Carson McCabe
		quest::faction(331, 2);		#:: + Merchants of Highpass
		quest::faction(230, 2);		#:: + Corrupt Qeynos Guards
		quest::faction(330, 2);		#:: + The Freeport Militia
		#:: Grant a small amount of experience, based on level
		$client->AddLevelBasedExp(2, 24);
		#:: Create a hash for storing cash - 1200 to 1400cp
		my %cash = plugin::RandomCash(1200,1400);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match one 13790 - Left Goblin Ear
	elsif (plugin::takeItems(13790 => 1)) {
		quest::say("Well done! We could really use the extra help around here.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(332, 2);		#:: + Highpass Guards
		quest::faction(329, 1);		#:: + Carson McCabe
		quest::faction(331, 1);		#:: + Merchants of Highpass
		quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
		quest::faction(330, 1);		#:: + The Freeport Militia
		#:: Grant a small amount of experience, based on level
		$client->AddLevelBasedExp(1, 24);
		#:: Create a hash for storing cash - 600 to 700cp
		my %cash = plugin::RandomCash(600,700);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
