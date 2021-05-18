sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail. $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	}
	elsif ($text=~/mail/i) {
		quest::say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	}
	elsif ($text=~/interested/i) {
		quest::say("I have messages that need to go to Freeport and to Qeynos.  Will you [deliver] mail to [Freeport] or to [Qeynos] for me?");
	}
	elsif ($text=~/freeport/i) {
		quest::say("Take this pouch of mail to Ton Twostring. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
		#:: Summon 18164 - Pouch of Mail (Freeport)
		quest::summonitem(18164);
	}
	elsif ($text=~/qeynos/i) {
		quest::say("Take this pouch to Eve Marsinger in Qeynos.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");
		#:: Summon 18165 - Pouch of Mail (Highpass)
		quest::summonitem(18165);
	}
	elsif ($text=~/highpass/i) {
		quest::say("Take this letter to Tralyn Marsinger. You can find him at the bard guild hall. I'm sure she will compensate you for your trouble.");
		#:: Summon 18154 - A Bardic Letter (Qeynos)
		quest::summonitem(18154);
	}
}

sub EVENT_ITEM {
	#:: Match a 18164 - Pouch of Mail 
	if (plugin::takeItems(18152 => 1)) {
		quest::say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 10); 		#:: + League of Antonican Bards
		quest::faction(281, 15); 		#:: + Knights of Truth
		quest::faction(262, -10); 		#:: + Guard of Qeynos
		quest::faction(304, -30); 		#:: - Ring of Scale
		quest::faction(285, -30); 		#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 900 to 2000cp
		my %cash = plugin::RandomCash(900,2000);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 18166 - Pouch of Mail
	if (plugin::takeItems(18156 => 1 )) {
		quest::say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 10); 		#:: + League of Antonican Bards
		quest::faction(281, 15); 		#:: + Knights of Truth
		quest::faction(262, -10); 		#:: + Guard of Qeynos
		quest::faction(304, -30); 		#:: - Ring of Scale
		quest::faction(285, -30); 		#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 900 to 2000cp
		my %cash = plugin::RandomCash(900,2000);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
