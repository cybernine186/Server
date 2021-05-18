sub EVENT_SIGNAL {
	#:: Match a signal "1" from 
	if ($signal == 1) {
		quest::say("Yeah, it seems hard to come by lately. We're all out of rat whiskers.");
		#:: Send a signal "1" to South Qeynos >> Caleah_Herblender (1118) with no delay
		quest::signalwith(1118,1,0);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
