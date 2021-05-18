sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello there stranger! What brings you here?");
	}
	elsif ($text=~/bread/i) {
		quest::say("So, ya want some of my bread is that it? Well, you've come to the right place I'd say. My brothers told me the market was ripe for that sort of thing so I decided to move on over here. Anyway, hand over two gold pieces and I'll give ya a sack of bread made by me own two hands.");
	}
}

sub EVENT_ITEM {
	#:: Match two gold pieces
	if (plugin::takeCoin(0, 0, 2, 0)) {
		quest::say("Yup, that's real gold alright.  Good enough then, here ya are.  Stop back anytime and we'll do business again.");
		#:: Give a 1838 - Bag of Bread Loaves
		quest::summonitem(1838);
		#:: Ding!
		quest::ding();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
