sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name! Be sure you watch your purse when walking around Qeynos at night. There seem to be a lot more thieves operating here than there used to be. We guards are doing our best to keep you safe, though.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
