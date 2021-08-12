sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, friend. My name is Joffrey. I'm trying to learn to play the flute. I'm also working on a new song I learned while I was visiting [Kelethin].");
	}
	elsif ($text=~/kelethin/i) {
		quest::say("I just got back from a trip to Faydwer. I was over there studying the lore of Tunare, in the beautiful elven city of Kelethin. I highly recommend visiting there as soon as you get a chance.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match when NPC arrives at waypoint 1
	if ($wp == 1) {
		quest::say("Belious, I'm working on this new tune I learned on my last trip to Kelethin. It's about Tunare. If you have a free ear, would you care to take a listen?");
		#:: Send a signal "2" to South Qeynos >> Belious_Naliedin (1125) with no delay
		quest::signalwith(1125, 2, 0);
	}
	#:: Match when NPC arrives at waypoint 2
	elsif ($wp == 2) {
		quest::say("Ahem. Tunare and the Pact, sung by Joffrey Clay.");
		#:: Do animation 58 - Dance
		quest::doanim(58);
		quest::say("La da di, la di da.. la da di. la di da..");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
