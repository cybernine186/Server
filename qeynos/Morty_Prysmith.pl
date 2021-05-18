sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings to you, $name. Try the Ogre Swills in this place. They get it to just the right consistency! You could stick a dagger in it and it would stand straight up!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
