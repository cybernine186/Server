sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Good ta see ya! Now start showin' these poodlewalkers how a real fish drinks!");
	}
	elsif ($text=~/low/i) {
		quest::say("This is going to sound crazy, but my main supplier of [Blackburrow Stout] is one of the brewers themselves. I have run too low on the fine brew and need someone to [pick up my shipment].");
	}
	elsif ($text=~/blackburrow stout/i) {
		quest::say("Keep it down!! So you've heard of Blackburrow Stout? We sell it here in Fish's Backroom. If the Qeynos Guards knew, well.. it wouldn't be such a good thing. The stout is illegal, It's made by the gnolls. It is one of the finest brews you will ever taste. If you want any.. slide me a [moonstone].");
	}
	elsif ($text=~/shipment/i) {
		quest::say("Take this note to the Qeynos Hills. Somewhere there, you shall find a gnoll at night called Gnasher. Give him the note. Now, get moving!");
		#:: Give a 18800 - Tattered Note
		quest::summonitem(18800);
	}
	elsif ($text=~/moonstone/i) {
		quest::say("Looking for moonstones, are we? The only way I know of getting a moonstone is to hunt gnolls for Captain Tillin of the Qeynos Guards.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 5) {
		quest::say("Blast!! We are running [low]!!");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Executioner.pl
	if ($signal == 1) {
		quest::say("You shall never take me alive!!");
		#:: Attack South Qeynos >> Executioner (1202)
		quest::attack(1202);
	}
}

sub EVENT_ITEM {
	#:: Match four 10070 - Moonstone
	if (plugin::takeItems(10070 => 4)) {
		quest::say("Here you go then. Don't go tellin' no Guards where that came from, I would hate to rid myself of a good paying customer.");
		#:: Give four 13107 - Black Burrow Stout
		quest::summonitem(13107,4);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(345, 4);		#:: + Karana Residents
		quest::faction(262, 4);		#:: + Guards of Qeynos
		quest::faction(341, 4);		#:: + Priests of Life
		quest::faction(280, 4);		#:: + Knights of Thunder
		#:: Grant a moderate amount of experience
		quest::exp(20000);
	}
	#:: Match three 10070 - Moonstone
	elsif (plugin::takeItems(10070 => 3)) {
		quest::say("Here you go then. Don't go tellin' no Guards where that came from, I would hate to rid myself of a good paying customer.");
		#:: Give four 13107 - Black Burrow Stout
		quest::summonitem(13107,3);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(345, 3);		#:: + Karana Residents
		quest::faction(262, 3);		#:: + Guards of Qeynos
		quest::faction(341, 3);		#:: + Priests of Life
		quest::faction(280, 3);		#:: + Knights of Thunder
		#:: Grant a moderate amount of experience
		quest::exp(15000);
	}
	#:: Match two 10070 - Moonstone
	elsif (plugin::takeItems(10070 => 2)) {
		quest::say("Here you go then. Don't go tellin' no Guards where that came from, I would hate to rid myself of a good paying customer.");
		#:: Give four 13107 - Black Burrow Stout
		quest::summonitem(13107,2);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(345, 2);		#:: + Karana Residents
		quest::faction(262, 2);		#:: + Guards of Qeynos
		quest::faction(341, 2);		#:: + Priests of Life
		quest::faction(280, 2);		#:: + Knights of Thunder
		#:: Grant a moderate amount of experience
		quest::exp(10000);
	}
	#:: Match one 10070 - Moonstone
	elsif (plugin::takeItems(10070 => 1)) {
		quest::say("Here you go then. Don't go tellin' no Guards where that came from, I would hate to rid myself of a good paying customer.");
		#:: Give four 13107 - Black Burrow Stout
		quest::summonitem(13107,1);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(345, 1);		#:: + Karana Residents
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(341, 1);		#:: + Priests of Life
		quest::faction(280, 1);		#:: + Knights of Thunder
		#:: Grant a moderate amount of experience
		quest::exp(5000);
	}
	#:: Match a 13131 - Case of Blackburrow Stout
	elsif (plugin::takeItems(13131 => 1)) {
		quest::say("Good work, pal. Here's a little dough to spend, just don't spend it at any other bar.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(345, 30);	#:: + Karana Residents
		quest::faction(262, 7);		#:: + Guards of Qeynos
		quest::faction(341, 4);		#:: + Priests of Life
		quest::faction(280, 9);		#:: + Knights of Thunder
		#:: Grant a moderate amount of experience
		quest::exp(5000);
		#:: Create a hash for storing cash - 300 to 400cp
		my %cash = plugin::RandomCash(30,30);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
