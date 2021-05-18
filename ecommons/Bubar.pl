sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, friend! I am Bubar, merchant from the burning sands. You must be thirsty or, perhaps, hungry. Please look over my goods.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12351 - Tiny Key, a 12352 - Tiny Key, and a 12350 - Gem Case
	if (plugin::takeItems(12351 => 1, 12352 => 1, 12350 => 1)) {
		quest::say("Mmmph!!.. *Pop!!* Ouch, my thumb!! Here you are. You had a gem inside.");
		#:: Give a 12349 - Sparkling Sapphire
		quest::summonitem(12349);
		#:: Ding!
		quest::ding();
		#:: Grant a large amount of experience
		quest::exp(15000);
	}
	else {
		quest::say("I need at least two of the case keys and the gem case.");
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
