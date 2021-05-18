sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings $name! I am Reuben Reldnok, first Paladin of the Deep Muses. When I was just a young lad I journeyed to Kaladim, the home of our cousins the Dwarves. At the Temple of the Duke of Below I studied the ways of a Paladin of our creator Brell Serilis. I have returned to Ak'Anon to train interested young gnomes the ways I have mastered so that we may defend Ak'Anon and Brells disciples everywhere from the threats that would see us destroyed.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
