sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome to my humble establishment! I specialize in cloth, but lately I have begun to dabble in silk, the finest material I have ever used.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
