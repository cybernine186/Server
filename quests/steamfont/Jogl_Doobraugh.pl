sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hellooo!!  My name is Jogl, master engineer with the Eldritch Collective.  And this here is Charlotte.  Pay no mind to her, She won't bite unless you attack me.");
		#:: Send a signal "1" to Steamfont Mountains >> Charlotte (56108) with a one second delay
		quest::signalwith(56108, 1, 1);
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 12
	if ($wp == 12) {
		#:: Send a signal "2" to Steamfont Mountains >> Charlotte (56108) with a one second delay
		quest::signalwith(56108, 2, 1);
	}
	#:: Match waypoint 18
	elsif ($wp == 18) {
		#:: Send a signal "3" to Steamfont Mountains >> Charlotte (56108) with a one second delay
		quest::signalwith(56108, 3, 1);
	}
}

sub EVENT_ITEM {
	#:: Match a 13209 - Blackbox XXVIIC
	if (plugin::takeItems(13209 => 1)) {
		quest::say("Hmmm. Here you go. Take this log to Drekon Vebnebber. He is the in-house merchant at Gemchoppers Hall. It is his duty to file away all these logs.");
		#:: Give a random item:  18837 - Daily Log or 18838 - Daily Log
		quest::summonitem(quest::ChooseRandom(18837, 18838));
		#:: Ding!
		quest::ding();
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Set factions
		quest::faction(245, 5);			#:: + Eldritch Collective
		quest::factino(238, -1);		#:: - Dark Reflection
		quest::faction(239, -1);		#:: - The Dead
		quest::faction(255, 1);			#:: + Gem Choppers
		quest::faction(333, 1);			#:: + King Ak'Anon	
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
