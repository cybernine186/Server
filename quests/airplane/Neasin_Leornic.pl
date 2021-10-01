sub EVENT_SPAWN {
	#:: Create a timer 'neasin_depop' that triggers every 300 seconds (5 min)
	quest::settimer("neasin_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'neasin_depop'
	if ($timer eq "neasin_depop") {
		quest::stoptimer("neasin_depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! Do you wish to begin your test of concentration, focus, or meditation?");
	}
	elsif ($text=~/concentration/i) {
		quest::say("Concentration it is. Proceed upward through the sky and return to me an Azure Tessera, an Augmentor’s Gem, and a Grey Damask Cloak. This will prove your ability to concentrate and I will reward you with an Augmentors Mask.");
	}
	elsif ($text=~/focus/i) {
		quest::say("Focus is a must. Travel among the residents of the sky and bring to me an Iron Disc, an Ethereal Opal, and a Woven Skull Cap. This will prove your ability to focus and I will reward you with Al`Kabors Cap.");
	}
	elsif ($text=~/meditation/i) {
		quest::say("Meditation, the fix for all. Fly to those above and return to me a Hyaline Globe, a Sky Topaz, and a High Quality Raiment. If you are successful, I will reward you with the Raiment of Thunder.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20930 - Azure Tessera, a 20741 - Augmentor's Gem, and a 20742 - Grey Damask Cloak
	if (plugin::takeItems(20930 => 1, 20741 => 1, 20742 => 1)) {			#:: Wizard Test of Concentration
		quest::say("Ah good. Take this as your reward.");
		#:: Give a 1272 - Augmentor's Mask
		quest::summonitem(1272);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
    		quest::depop();
	}
	#:: Match a 20937 - Iron Disc, a 20743 - Ethereal Opal, and a 20744 - Woven Skull Cap
	elsif (plugin::takeItems(20937 => 1, 20743 => 1, 20744 => 1)) {			#:: Wizard Test of Focus
		quest::say("Ah good. Take this as your reward.");
		#:: Give a 1271 - Al`Kabor's Cap of Binding
		quest::summonitem(1271);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
    		quest::depop();
	}
	#:: Match a 20944 - Hyaline Globe, a 20745 - Sky Topaz, and a 20746 - High Quality Raiment
	elsif (plugin::takeItems(20944 => 1, 20745 => 1, 20746 => 1)) {			#:: Wizard Test of Meditation
		quest::say("Ah good. Take this as your reward.");
		#:: Give a 1273 - Raiment of Thunder
		quest::summonitem(1273); #raiment of thunder
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
    		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
