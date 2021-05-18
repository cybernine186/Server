sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("If you are a fellow merchant. I must warn you of the inevitable tax increase.  Antonius Bayle is soon to make a [deal] with the people of Surefall Glade.");
	}
	elsif ($text=~/deal/i) {
		quest::say("Bayle is soon to sign a law which will raise the taxes on all bear hides.  This is to keep the purchase of the hides to a minimum.  All this to keep the treehuggers happy!!");
	}
}

sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/campnight.pl
	if ($signal == 1) {
		#:: Stop pathing grid 59
		quest::stop();
		#:: Close up shop for the night
		$npc->MerchantCloseShop();
	}
	#:: Match signal "2" from qeynos/campday.pl
	elsif ($signal == 2) {
		#:: Start pathing on grid 59
		quest::start(59);
		#:: Open up shop for the day
		$npc->MerchantOpenShop();
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
