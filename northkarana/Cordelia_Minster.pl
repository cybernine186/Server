sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings!  I am Cordelia, a traveling piper. I am afraid I cannot play a tune for you, however, as my [flute] is gone.");
	}
	elsif ($text=~/flute/i) {
		quest::say("I traded my flute to a hermit in the southern plains of Karana. I had a spare flute, but that was taken from me by some bandits. If you could find this hermit and ask him for my flute back, I would be most appreciative.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13310 - Cracked Flute
	if (plugin::takeItems(13310 => 1)) {
		quest::say("Why thank you, kind adventurer! Here is a little something to keep food in your belly. Now back to practice. La la la..");
		#:: Give a 13119 - Winds of Karana sheet 2
		quest::summonitem(13119);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 5);		#:: + League of Antonican Bards
		quest::faction(281, 1);		#:: + Knights of Truth
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(304, -1);	#:: - Ring of Scale
		quest::faction(285, -1);	#:: - Mayong Mistmoore
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 10 to 30cp
		my %cash = plugin::RandomCash(10,30);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 1, 3, or 8
	if (($wp == 1) || ($wp == 3) || ($wp == 8)) {
		#:: Set running true (run)
		quest::SetRunning(1);
	}
	#:: Match waypoint 2, 6, or 10
	elsif (($wp == 2) || ($wp == 6) || ($wp == 10)) {
		#:: Set running false (walk)
		quest::SetRunning(0);
	}
}
