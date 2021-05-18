sub EVENT_SAY {
	#:: Match any text
	if ($text) {
		quest::say("Close the door and be gone fool! You are going to give away my hiding spot!");
	}
}

sub EVENT_ITEM {
	#:: Turn in for 10400 -  Greater Lighstone
	if (plugin::check_handin(\%itemcount, 10400 => 1)) {
		quest::say("At last I may leave this place!! Good luck destroying my abomination, you will surely need it against my most powerful yet uncontrolable creation!");
		#:: Spawns Khrixs Abomination
		quest::spawn2(63111,0,0,60,622,20,0);
		#:: Give a small amount of xp
		quest::exp(1000);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(238,1); 		#:: + Dark Reflection
		quest::faction(245,-1); 		#:: - Eldritch Collective
		quest::faction(255,-1); 	#:: - Gem Choppers
		quest::faction(240,-1); 		#:: - Deep Muses
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
