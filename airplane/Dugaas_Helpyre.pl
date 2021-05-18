sub EVENT_SPAWN {
	#:: Create a timer 'dugaas_depop' that triggers every 300 seconds (5 min)
	quest::settimer("dugaas_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'dugaas_depop'
	if ($timer eq "dugaas_depop") {
		quest::stoptimer("dugaas_depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("So, you dare be seen in my precense. Truly a brave fool you are. You come seeking fame and glory here do you? Well fool, perhaps you will get what you seek. Shall you take the test of the Heart, the Hands, or the Finger?");
	}
	elsif ($text=~/heart/i) {
		quest::say("So the heart it be. Bring me, foolish one, an Imp Statuette, an Obsidian Amulet, and a Pulsating Ruby. Perhaps then, you shall find your reward.");
	}
	elsif ($text=~/hands/i) {
		quest::say("The test of the Hands it shall be. Bring me a Gorgon's Head, some Aged Nectar, a Glowing Black Pearl, and an Efreeti's Great Staff. When you return, I shall reward you for your deeds, assuming you live through the experience. Hahaha!");
	}
	elsif ($text=~/finger/i) {
		quest::say("The finger. Needed for nearly every casting you shall ever hope to produce, it truly is the most powerful creation. Should you bring me a White Spiroc Feather, a Nebulous Ring, and the Ring of Veeshan, I shall reward you with power that you can just now begin to comprehend.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20953 - Imp Statuette, a 20786 - Obsidian Amulet, and a 20787 - Pulsating Ruby
	if (plugin::takeItems(20953 => 1, 20786 => 1, 20787 => 1)) {				#:: Necromancer Test of Heart
		quest::say("Haha! So you lived! Take this and be gone!");
		#:: Give a 14560 - Sphinx Heart Amulet
		quest::summonitem(14560);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20790 - Gorgon Head, a 20967 - Aged Nectar, a 20791 - Glowing Black Pearl, and a 20792 - Efreeti Great Staff
	elsif (plugin::takeItems(20790 => 1, 20967 => 1, 20791 => 1, 20792 => 1)) {		#:: Necromancer Test of Hands
		quest::say("Haha! So you lived! Take this and be gone!");
		#:: Give a 11689 - Gorgon Head Staff
		quest::summonitem(11689);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20960 - White Spiroc Feather, a 20788 - Nebulous Ruby, and a 20789 - Ring of Veeshan
	elsif (plugin::takeItems(20960 => 1, 20788 => 1, 20789 => 1)) {				#:: Necromancer Test of the Finger
		quest::say("Haha! So you lived! Take this and be gone!");
		#:: Give a 27713 - Band of Wailing Winds
		quest::summonitem(27713);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
