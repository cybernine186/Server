sub EVENT_SPAWN {
	quest::emote("runs up and steals the note.");
	quest::say("Aha!! Foolish Qeynite or whatever you call yourself!! I have found the note and now I shall take it to my superior!! Just try and catch me!!");
	#:: Set running to true (run)
	quest::SetRunning(1);
	#:: Start Grid 87
	quest::start(87);
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match at grid entry 7 - at the toll booth
	if ($wp == 7) {
		quest::depop();
	}
}

sub EVENT_AGGRO {
	quest::say("Die, dog!!");
}


sub EVENT_DEATH_COMPLETE {
	quest::say("Your name shall be added to the most wanted list of the Freeport Militia!!");
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
