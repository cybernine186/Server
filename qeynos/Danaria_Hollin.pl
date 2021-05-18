sub EVENT_WAYPOINT_ARRIVE {
	#:: Match when NPC arrives at waypoint 5
	if ($wp == 5) {
		quest::say("I would like an Erudian tart, please.");
		#:: Send a signal "1" to South Qeynos >> Karn_Tassen (1110) with a 0 second delay
		quest::signalwith(1110,1,0);
	}
	#:: Match when NPC arrives at waypoint 8
	elsif ($wp == 8) {
		quest::say("Time in the pub shall keep them from advancing to the next level of the mind. When will they learn?");
	}
	#:: Match when NPC arrives at waypoint 26
	elsif ($wp == 26) {
		quest::say("A magnificent piece of workmanship! The clock, too.");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Karn_Tassen.pl
	if ($signal == "1") {
		quest::say("Just get me the tart and put your eyes back in your sockets or I'll pry them out for good!");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings! Nice to meet someone with manners. I do not see how you people stand to live in this madhouse of ruffians. I would have left weeks ago if I were not waiting for a delivery. Oh, well. Nice to have met you.");
	}
	elsif ($text=~/delivery/i) {
		quest::say("I am in Qeynos to meet up with a fellow Erudite coming from Freeport. He is two weeks late and I fear the worst. I shall need to hire some lackey to go to Freeport to find him.");
	}
	elsif ($text=~/find him/i) {
		quest::say("Yes, that might work. Please go to Freeport and find him. His name is Palatos Kynarn. Tell him that Danaria has sent you for the painting. And be quick about it! Thank you.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
