sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Do I know you? Don't stick your nose where it don't belong. It might just get cut off.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18793 - Lomarc's Payment
	if (plugin::takeItems(18793 => 1)) {
		quest::say("What the heck is this?!? No money at all? You'll pay for this you back-stabbing punk!");
		quest::attack($name);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
