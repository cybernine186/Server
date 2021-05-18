sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name. If you are interested in helping the League of Antonican Bards by delivering some mail then you should talk to my wife, Eve.");
	}
}

sub EVENT_ITEM {
	#:: Match turn in for 18150 - Bardic Letter (Qeynos)
	if (plugin::takeItems(18150 => 1)) {
		quest::say("Incoming mail - very good! Please take this gold for your troubles.");
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(284,10); 	#:: + League of Antonican Bards
		quest::faction(281,10); 	#:: + Knights of Truth
		quest::faction(262,10); 	#:: + Guards of Qeynos
		quest::faction(304,-15); 	#:: - Ring of Scale
		quest::faction(285,-15); 	#:: - Mayong Mistmoore
		#:: Give a small amount of xp
		quest::exp(100);
		#:: Create a hash for storing cash - 100 to 600cp
		my %cash = plugin::RandomCash(100,600);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match turn in for 18151 - Bardic Letter (Qeynos)
	elsif (plugin::takeItems(18151 => 1)) {
		quest::say("Incoming mail - very good! Please take this gold for your troubles.");
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(284,10); 	#:: + League of Antonican Bards
		quest::faction(281,10); 	#:: + Knights of Truth
		quest::faction(262,10); 	#:: + Guards of Qeynos
		quest::faction(304,-15); 	#:: - Ring of Scale
		quest::faction(285,-15); 	#:: - Mayong Mistmoore
		#:: Give a small amount of xp
		quest::exp(100);
		#:: Create a hash for storing cash - 100 to 600cp
		my %cash = plugin::RandomCash(100,600);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match turn in for 18153 - Bardic Letter (Qeynos)
	elsif (plugin::takeItems(18153=> 1)) {
		quest::say("Incoming mail - very good! Please take this gold for your troubles.");
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(284,10); 	#:: + League of Antonican Bards
		quest::faction(281,10); 	#:: + Knights of Truth
		quest::faction(262,10); 	#:: + Guards of Qeynos
		quest::faction(304,-15); 	#:: - Ring of Scale
		quest::faction(285,-15); 	#:: - Mayong Mistmoore
		#:: Give a small amount of xp
		quest::exp(100);
		#:: Create a hash for storing cash - 100 to 1200cp
		my %cash = plugin::RandomCash(100,1200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match urn in for 18154 - Bardic Letter (Qeynos)
	elsif (plugin::takeItems(18154 => 1)) {
		quest::say("Incoming mail - very good! Please take this gold for your troubles.");
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(284,10); 	#:: + League of Antonican Bards
		quest::faction(281,10); 	#:: + Knights of Truth
		quest::faction(262,10); 	#:: + Guards of Qeynos
		quest::faction(304,-15); 	#:: - Ring of Scale
		quest::faction(285,-15); 	#:: - Mayong Mistmoore
		#:: Give a small amount of xp
		quest::exp(100);
		#:: Create a hash for storing cash - 100 to 1200cp
		my %cash = plugin::RandomCash(100,1200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
