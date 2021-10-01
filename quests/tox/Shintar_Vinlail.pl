sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("That was not a very intelligent thing to do");
	}
}

sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("I have no time to answer questions. whelp!  Now. leave this place before the sting of death finds the life in your veins!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My comrades will avenge my death.");
}
