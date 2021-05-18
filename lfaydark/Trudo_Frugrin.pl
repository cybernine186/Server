sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("What. what?!! I am quite busy here. I have studies to complete and charts to make!");
	}
	elsif ($text=~/lens/i) {
		quest::say("Yes, of course. Here you are. Now be off.");
		#:: Give a 13275 - Telescope Lens
		quest::summonitem(13275);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
