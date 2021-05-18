sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Excuse me, but you should not be down in the pens.  There are very dangerous creatures kept here.  For the gladiator games, you know.");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("Arrggg... when the... Steel Warriors... or... Qeynos Guards hear of this... you'll wish you'd never... set foot in this city...");
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
