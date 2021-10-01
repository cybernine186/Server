sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name. I am the leader of this beleagured troop of rangers. Even though the once fair Kithicor slowly succumbs to the [darkness] at hand, we shall not abandon the woods without a fight.");
	}
	elsif ($text=~/darkness/i) {
		quest::say("The denizens of these woods are slowly being overrun by dark fiends and shadowed men. As valiantly as we have fought, our numbers dwindle. We know very little about our aggressors, but if we [acquire some information] or perhaps [fine weapons], then we may yet have a chance to retake the woods once more.");
	}
	elsif ($text=~/acquire some information/i) {
		quest::say("Your tracking skills are invaluable to our cause, brave $name. Our scouts have reported of a Ghoul Messenger. They have spotted him traveling between Kithicor and an undead camp in the Plains of Karana. They have attempted to track the monster and obtain any Strategic Domumentation he may be carrying. Perhaps you can succeed where others have failed. Perhaps you can earn my personal short sword.");
	}
	elsif ($text=~/fine weapons/i) {
		quest::say("My soldiers are valiant, but poorly equipped. I have heard of a magical weapon of great power, some call it the Ebony Blade. Amongst the Froglocks there can be found a Minotaur who wields this sword of might. If you are a ranger and could provide me with this sword then I would gladly exchange it with my own meager weapon. If you prefer, you may attempt to [acquire some information] for us instead.");
	}
	elsif ($text=~/another service/i) {
		quest::say("Very well then, your help will bring us closer to solving the mystery of Kithicor! Find Bryn Fynndel in Lesser Faydark and tell him Morin sent you. His band of elven warriors are observing the activities of the Crushbone Orcs and Mistmoore dark elves, perhaps you can help them shed some light on our plight.");
	}
}

sub EVENT_ITEM {
	#:: Match a 16548 - Strategic Map of Kithicor
	if (plugin::takeItems(16548 => 1)) {
		quest::say("Excellent work, $name!! It is obvious that you are a highly skilled tracker and warrior. Accept this reward, my personal sword which has served me well in countless battles. Perhaps you are willing to perform [another service]?");
		#:: Give a 5422 - Short Sword of Morin
		quest::summonitem(5422);
	}
	#:: Match a 5405 - Ebony Bladed Sword
	elsif (plugin::takeItems(5405 => 1)) {
		quest::say("Excellent work, $name!! It is obvious that you are a highly skilled tracker and warrior. Accept this reward, my personal sword which has served me well in countless battles.");
		#:: Give a 5422 - Short Sword of Morin
		quest::summonitem(5422);
	}
	#:: Match a 20638 - Sealed Ghoul Boss' Log Book
	elsif (plugin::takeItems(20638 => 1)) {
		quest::say("We meet again, $name. This log reveals much of the machinations of our dark oppressors, but not enough. Deliver these orders to Bryn in Lesser Faydark, and he will provide you with another weapon to aid in our defense of Kithicor.");
		#:: Give a 20639 - Orders for Bryn
		quest::summonitem(20639);
	}
#::	plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
	#:: Return unused items
	plugin::returnUnusedItems();
}
