sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name! Spend your time wisely in the city of Qeynos. Do not let your mind wander to thoughts of bravado or crime. My guards can easily put to rest any outbreaks. Good day to you, citizen!");
	}
	elsif ($text=~/executioner/i) {
		quest::say("The executioner is quite an exceptional person. [Field Marshal Ralem] happened upon her while on a secret operation in Everfrost Peaks. They fought side by side against some creature the locals named Iceberg. The creature escaped. Ralem was grateful and eventually recruited her when she decided to separate from the guards of Halas.");
	}
	elsif ($text=~/field marshal ralem/i) {
		quest::say("Field Marshall Ralem Christof is in charge of a brigade of roving rangers, druids and warriors. He hails from the Jaggedpine. He is quite an exceptional ranger. No one is ever really sure where he is. His brigade is constantly on the move.");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Executioner.pl
	if ($signal == 1) {
		quest::say("Ah.  Good.  You have arrived.  Executioner, could you please visit McNeal Jocub at Fish's Tavern.  He has violated our laws and the sentence is death.");
		#:: Send a signal "1" to South Qeynos >> Executioner (1202) with no delay
		quest::signalwith(1202,1,0);
	}
}

sub EVENT_ITEM {
	#:: Match a 18815 - Tattered Note
	if (plugin::takeItems(18815 => 1)) {
		quest::say("I heard you were on your way. I have called for the state [executioner]. She should be on her way now. She will deal with our friend, McNeal Jocub. Thank you for your help, citizen.");
		#:: Give a 13305 - Medal of Merit
		quest::summonitem(13305);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 5);			#:: + Guards of Qeynos
		quest::faction(219, 3);			#:: + Antonius Bayle
		quest::faction(230, -5);		#:: - Corrupt Qeynos Guards
		quest::faction(223, -5);		#:: - Circle Of Unseen Hands
		quest::faction(291, 3);			#:: + Merchants of Qeynos
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 1300 to 1400cp
		my %cash = plugin::RandomCash(1300,1400);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Spawn one and only one South Qeynos >> Executioner (1202) on pathing grid 62	
		quest::unique_spawn(1202,62,0,-412,75,-24,0);
	}
	#:: Match a 18912 - Tattered Cloth Note
	elsif (plugin::takeItems(18912 => 1)) {
		quest::say("So, an assassin has been sent to Qeynos! I shall have my guards keep an eye out for any suspicious looking visitors. As for you... you should speak with the Surefall Glade ambassador. Ambassador Gash is staying at the Lion's Mane Inn here in South Qeynos. Inform him that [an assassin has been sent to kill] him. Do not let the assassin near him!");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 5);			#:: + Guards of Qeynos
		quest::faction(219, 1);			#:: + Antonius Bayle
		quest::faction(230, -1);		#:: - Corrupt Qeynos Guards
		quest::faction(223, -1);		#:: - Circle Of Unseen Hands
		quest::faction(291, 1);			#:: + Merchants of Qeynos
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Match four 13915 - Gnoll Fang
	elsif (plugin::takeItems(13915 => 4)) {
		quest::say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		#:: Give three 10070 - Moonstone
		quest::summonitem(10070);
		quest::summonitem(10070);
		quest::summonitem(10070);
		quest::summonitem(10070);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 12);		#:: + Guards of Qeynos
		quest::faction(219, 4);			#:: + Antonius Bayle
		quest::faction(230, -4);		#:: - Corrupt Qeynos Guards
		quest::faction(223, -4);		#:: - Circle Of Unseen Hands
		quest::faction(291, 4);			#:: + Merchants of Qeynos
		#:: Grant a large amount of experience
		quest::exp(28000);
	}
	#:: Match three 13915 - Gnoll Fang
	elsif (plugin::takeItems(13915 => 3)) {
		quest::say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		#:: Give three 10070 - Moonstone
		quest::summonitem(10070);
		quest::summonitem(10070);
		quest::summonitem(10070);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 9);			#:: + Guards of Qeynos
		quest::faction(219, 3);			#:: + Antonius Bayle
		quest::faction(230, -3);		#:: - Corrupt Qeynos Guards
		quest::faction(223, -3);		#:: - Circle Of Unseen Hands
		quest::faction(291, 3);			#:: + Merchants of Qeynos
		#:: Grant a large amount of experience
		quest::exp(21000);
	}
	#:: Match two 13915 - Gnoll Fang
	elsif (plugin::takeItems(13915 => 2)) {
		quest::say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		#:: Give two 10070 - Moonstone
		quest::summonitem(10070);
		quest::summonitem(10070);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 6);			#:: + Guards of Qeynos
		quest::faction(219, 2);			#:: + Antonius Bayle
		quest::faction(230, -2);		#:: - Corrupt Qeynos Guards
		quest::faction(223, -2);		#:: - Circle Of Unseen Hands
		quest::faction(291, 2);			#:: + Merchants of Qeynos
		#:: Grant a large amount of experience
		quest::exp(14000);
	}
	#:: Match a 13915 - Gnoll Fang
	elsif (plugin::takeItems(13915 => 1)) {
		quest::say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		#:: Give a 10070 - Moonstone
		quest::summonitem(10070);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 3);			#:: + Guards of Qeynos
		quest::faction(219, 1);			#:: + Antonius Bayle
		quest::faction(230, -1);		#:: - Corrupt Qeynos Guards
		quest::faction(223, -1);		#:: - Circle Of Unseen Hands
		quest::faction(291, 1);			#:: + Merchants of Qeynos
		#:: Grant a large amount of experience
		quest::exp(7000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
