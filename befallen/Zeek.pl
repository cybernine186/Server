sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Ah, so many dead to destroy, so little time. What is it you want? You seek the [potions] perhaps?");
	}
	elsif ($text=~/potions/i) {
		quest::say("Give me the four clues.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18651 - Note to Troll, 18652 - First Riddle for the Troll, 18653 - Second Riddle for the Troll, 18654 - Third Riddle for the Troll
	if (plugin::takeItems(18651 => 1, 18652 => 1, 18653 => 1, 18654 => 1)) {
		#:: Give a 13984 - Crate of Potions
		quest::summonitem(13984);
		#:: Ding!
		quest::ding();		
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
