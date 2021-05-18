sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings. I am pleased to report that I am fully stocked. Please have a look at the goods I have for sale.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
