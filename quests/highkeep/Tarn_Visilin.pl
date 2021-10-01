sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello. I am Tarn Visilin.");
	}
}

sub EVENT_ITEM {
	#:: Match 50 gole pieces and a 10086 - Glamour Stone
	if (plugin::takeItemsCoin(0, 0, 50, 0, 10086 => 1)) {
		quest::say("Your glamour stone has been fully enchanted. Take it and the golden rod back to the temple of Ro.");
		#:: Give a 10087 - Glowing Glamour Stone
		quest::summonitem(10087);
		#:: Ding!
		quest::ding();
	}
	#:: Match a 10019 - Bloodstone
	elsif (plugin::takeItems(10019 => 1)) {
		quest::say("The gleam of blood - and now the gleam of gloves.");
		#:: Give a 2355 - Gleaming Gloves
		quest::summonitem(2355);
		#:: Ding!
		quest::ding();
	}
	#:: Match a 10790 - Coin of Tash
	elsif (plugin::takeItems(10790 => 1)) {
		quest::say("The Coin of Tash! Very good. I have laid a basic enchantment on it - to get it further enchanted you must take the coin to Mizr N'Mar in the Library of Neriak.");
		#:: Give a 10791 - Glowing Coin of Tash
		quest::summonitem(10791);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
