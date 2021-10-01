sub EVENT_SPAWN {
	#:: Set a timer that loops every 900 seconds (15 min)
	quest::settimer("despawn", 900);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Step right up! I am the best butcher you have ever seen. Well, are you the next to be fileted");
	}
	elsif ($text=~/come back to the closet/i) {
		quest::say("Darn!! I was just starting to have fun. Tell you what. You find me a nice Ogre Butcher Apron and I will gladly go back to my cramped quarters.");
	}
}

sub EVENT_TIMER {
	#:: Match the timer "despawn"
	if ($timer eq "despawn") {
		#:: Stop the timer from looping over and over
		quest::stoptimer("despawn");
		#:: Depop
		quest::depop();
	}
}

sub EVENT_ITEM {
	#:: Match a 12217 - Ogre Butcher Apron
	if (plugin::takeItems(12217 => 1)) {
		quest::say("'Great! Thanks a lot, pal. Lets get moving. I hear my bonehead roomie called the Captain was spotted by Basher Sklama. Go ask [where the Captain] is.");
		#:: Give a 12214 - The Butcher
		quest::summonitem(12214);
		#:: Ding!
		quest::ding();
		#:: Stop the timer from looping over and over
		quest::stoptimer("despawn");
		#:: Depop
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
