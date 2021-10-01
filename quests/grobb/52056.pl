sub EVENT_SPAWN {
	#:: Set a timer that loops every 900 seconds (15 min)
	quest::settimer("despawn", 900);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Sorry. Nothing to sell at this time. Maybe later. Good day.");
	}
	elsif ($text=~/come back to the closet/i) {
		quest::say("Back to the closet?!! I just got out. I would go back if I had a pair of Oven Mittens.");
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
	#:: Match a 12211 - Grobb Oven Mittens
	if (plugin::takeItems(12211 => 1)) {
		quest::say("Ahh!! Oven Mittens!! Kinda' large, don't you think?!! Oh well, now I can bake all I want without burning my hands. OK!! Let's go. I overheard some Basher named Nanrum saying he spotted my friend, The Butcher. You should ask him [wheres the skeleton].");
		#:: Give a 12213 - The Baker
		quest::summonitem(12213);
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
