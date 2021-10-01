sub EVENT_AGGRO {
	quest::say("Your rotting corpse will warn others to fear the disease of the Bloodsabers!");
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("You have set foot upon the sacred grounds of the Shrine of Bertoxxulous. You had best have business here or this dirt shall become your grave.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
