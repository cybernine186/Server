sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/Trumpy_Irontoe.pl
	if ($signal == 1) {
		quest::say("Trumpy, you are one sick little man!");
		#:: Send a signal "3" to South Qeynos >> Trumpy_Irontoe (1042) with no delay
		quest::signalwith(1042,3,0);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
