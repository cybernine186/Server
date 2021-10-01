sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("How are you doing this fine day?  I am sure you are an adventurer and I know adventurers are weighed down by excessive platinum coins.  Why not purchase something?");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
