sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings!  Please do not ask me to donate to the Knights of Truth or the Priests of Life.  I have enough gold going to the city of Qeynos with all these new taxes!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
