#:: See also:  qeynos/#Lanhern_Firepride.pl

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Good day, traveler! You look as though you are in need of [superior armor]. We here at Firepride's specialized in armor.");
	}
	elsif ($text=~/superior armor/i) {
		quest::say("Our forge skills were acquired from the armor lords of Kaladim, as were our [drinking skills].");
	}
	elsif ($text=~/drinking skills/i) {
		quest::say("I learned the love of ale from the dwarves of Kaladim. Maybe someday I sall see you in the backroom at Fish's. If I do, don't forget to buy me an Ogre Swill.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
