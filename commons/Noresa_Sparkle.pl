sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("He.. Hello. Wou.. would you like to buy something? Be quick or [Kizdean] will return!");
	}
	elsif ($text=~/kizdean/i) {
		quest::say("Sshhh..Please..save me. Get..rid..of..him.");
	}
}

sub EVENT_ITEM {
	#:: Match a 17931 - Sparkle
	if (plugin::takeItems(17931 => 1)) {
		quest::say("Oh!!! Thank you. You are my hero. I have been held captive by that horrid dark elf for weeks. Please take this. It was the key to a gem case which was stolen from me by an unseen rogue. If you find the gem case you can take it and the key to the original craftsman. He can open it with only two keys.");
		#:: Give a 12352 - Tiny Key
		quest::summonitem(12352);
		#:: Ding!
		quest::ding();
		#:: Grant a large amount of experience
		quest::exp(15000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
