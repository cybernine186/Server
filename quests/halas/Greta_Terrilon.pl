sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("You will have to excuse me. I am quite busy.");
	}
	elsif ($text=~/some ink/i) {
		quest::say("Oh, sure. Here you go.");
		#:: Give a 12619 - Vial of Datura Ink
		quest::summonitem(12619);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
