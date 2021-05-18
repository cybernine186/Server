sub EVENT_SPAWN {
	#:: Set a timer "depop" to loop every 1200 seconds (20 minutes)
	quest::settimer("depop", 1200);
	#:: Set running to true (run)
	quest::SetRunning(1);
}

sub EVENT_TIMER {
	#:: Match timer "depop"
	if ($timer eq "depop") {
		quest::depop();
	}
}

sub EVENT_COMBAT {
	#:: Match if combat state is 1 (fighting)
	if ($combat_state == 1) {
		quest::say("The time fer talk is over.  Raise yer guard!!");
		#:: Send a signal "2" to /qey2hh1/Frostbite.pl with no delay
		quest::signalwith(12082, 2, 0);
		#:: Send a signal "2" to /qey2hh1/Frostbite.pl with no delay
		quest::signalwith(12154, 2, 0);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
