sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings. This is a grand city. I plan to make much profit here.");
	}
}

sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/campnight.pl
	if ($signal == 1) {
		#:: Stop pathing grid 57
		quest::stop();
		#:: Close up shop for the night
		$npc->MerchantCloseShop();
	}
	#:: Match signal "2" from qeynos/campday.pl
	elsif ($signal == 2) {
		#:: Start pathing on grid 57
		quest::start(57);
		#:: Open up shop for the day
		$npc->MerchantOpenShop();
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
