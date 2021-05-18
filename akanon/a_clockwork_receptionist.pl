sub EVENT_SAY {
	if ($text=~/king/i) {
		quest::say("Brell strike you down for not knowing!!  Who could not have heard of the name of his royal highness King Horatio Ak'Anon. This great city is named after him. He rules from his throne room in Ak'Anon Palace which he constructed upon the underground lake.");
	}
	elsif ($text=~/clock/i) {
		quest::say("The clockworks of Ak'Anon are automata created by the Eldritch Collective. They come in many models from combat to service. All are formidable opponents.");
	}
	elsif ($text=~/eldritch collective/i) {
		quest::say("The Eldritch Collective contains the combined talents of all three circles of magic and our knowledge of tinkering. They are unique and spend their days studying and designing in the great Library of Mechanimagica.");
	}
	elsif ($text=~/gemchoppers/i) {
		quest::say("In Gemchopper Hall you will find our warriors, the Gemchoppers. It is from among their ranks that we recruit our Watchmen.");
	}
	elsif ($text=~/watchmen/i) {
		quest::say("The Watchmen of Ak'Anon are elite gnome warriors. They are few as most gnomes do not care to enter combat. Most rely on the power of our clockworks. The Watchmen are members of the Gemchoppers.");
	}
	elsif ($text=~/meldrath/i) {
		quest::say("Meldrath was once a mad gnome of the Eldritch Collective. He began to dabble in the black art of necromancy. His heart and mind soon turned black and evil. He rebelled against the Eldritch Collective and went into the Steamfont Mountains to create a fortress. We sent an army of clockworks to exterminate him and his followers.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
