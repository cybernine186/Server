sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome. I am Ezmirella.");
	}
}

sub EVENT_ITEM {
	#:: Match a 6338 - Silver Wand, and 50 gold pieces
	if (plugin::takeItemsCoin(0, 0, 50, 0, 6338 => 1)) {
		quest::say("I have blessed your silver wand.  To complete the enchantment, you must take the wand to Raine Beteria in the Erudin Library.  Tip her 50 golden coins, and she will help you.");
		#:: Give a 6339 - Blessed Silver Wand
		quest::summonitem(6339);
		#:: Ding!
		quest::ding();
		#:: Grant a moderate amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
