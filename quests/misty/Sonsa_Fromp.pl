sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello, traveler. It is so good to meet you. I am Sonsa Fromp, tailor supreme. I have been known to make the finest leather armor this side of the wall. Feel free to inspect my merchandise. Buy plenty. This is how I put food on the table.");
	}
	elsif ($text=~/kevlin/i) {
		quest::say("Oooh!! Do not speak that name in this burrow! He used to be my husband. Now he has left me for that trollop, Lashinda Hoggletop!");
	}
	elsif ($text=~/lashinda/i) {
		quest::say("Never mention that name in this burrow!!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
