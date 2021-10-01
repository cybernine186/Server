sub EVENT_SPAWN {
	#:: Create a timer 'denise_depop' that triggers every 300 seconds (5 min)
	quest::settimer("denise_depop", 300);
}


sub EVENT_TIMER {
	#:: Match a timer 'denise_depop'
	if ($timer eq "denise_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hi there $name! I give three sections of the test of songs, Denise does the rest. Do you wish to take the test of pitch, voice, or tone?");
	}
	elsif ($text=~/pitch/i) {
		quest::say("The pitch that we sing and play has a great affect on those that listen.  Keep this in mind Gendal, and you shall always be welcome in taverns and inns.  Now if you return to me Phosphoric Globe, a Shimmering Diamond, and crude wooden flute I will give to you Ervaj's Flute of Flight.");
	}
	elsif ($text=~/voice/i) {
		quest::say("The sweet sound rising forth from our throats are what makes us truly great.  Go forth and give voice to your songs, and return to me a platinum disc, a music box, and a light woolen mantle. If you do this I shall give you the Songweaver's Mantle. Good luck!");
	}
	elsif ($text=~/tone/i) {
		quest::say("Tone is important to all singers. Prove to me that you can keep your tone even and pure by bringing me an Ochre Tessera, a songbird statuette, and a light woolen cloak. If you do this I will give you the Mask of the Songbird.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20947 - Phosphoric Globe, a 20824 - Shimmering Diamond, and a 20825 - Crude Wooden Flute
	if (plugin::takeItems(20947 => 1, 20824 => 1, 20825 => 1)) {				#:: Bard Test of Pitch
		quest::say("Excellent! Take this as your reward.");
		#:: Give a 27722 - Ervaj's Flute of Flight
		quest::summonitem(27722);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20940 - Platinum Disc, a 20822 - Music Box, and a 20823 - Light Woolen Mantle
	elsif (plugin::takeItems(20940 => 1, 20822 => 1, 20823 => 1)) {				#:: Bard Test of Voice
		quest::say("Excellent! Take this as your reward.");
		#:: Give a 27721 - Mantle of the Songweaver
		quest::summonitem(27721);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20933 - Ochre Tessera, a 20823 - Light Woolen Mantle, and a 20820 - Songbird Statuette
	elsif (plugin::takeItems(20933 => 1, 20823 => 1, 20820 => 1)) {				#:: Bard Test of Tone
		quest::say("Excellent! Take this as your reward.");
		#:: Give a 27720 - Mask of Song
		quest::summonitem(27720);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
