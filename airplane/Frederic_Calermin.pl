sub EVENT_SPAWN {
	#:: Create a timer 'frederic_depop' that triggers every 300 seconds (5 min)
	quest::settimer("frederic_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'frederic_depop'
	if ($timer eq "frederic_depop") {
		quest::stoptimer("frederic_depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! I offer to you three challenges. Clarification, Empowerment, Gesticulation, and Shielding. Please choose one of these.");
	}
	elsif ($text=~/clarification/i) {
		quest::say("Clarification it is. Proceed upward through the sky and return to me a Crimson Tessera, an Ethereal Sapphire, and Feathered Cape.  This will prove your abilities to me and I will reward you with the Bracelet of Clarification.");
	}
	elsif ($text=~/empowerment/i) {
		quest::say("Empowerment it is. Proceed upward through the sky and return to me an Iron Disc, a Gem of Empowerment, and a Ceramic Mask. This will prove your abilities to me and I will reward you with the Mask of Empowerment.");
	}
	elsif ($text=~/gesticulation/i) {
		quest::say("Gesticulation it is. Proceed upward through the sky and return to me an Efreeti Magi Staff, Sweet Nectar, a Sphinx Crown, and a Hazy Opal.  This will prove your abilities to me and I will reward you with the staff of the Magister");
	}
	elsif ($text=~/shielding/i) {
		quest::say("Shielding it is. Proceed upward through the sky and return to me a Hyaline Globe, an Ivory Pendant, and a Golden Coffer. This will prove your abilities to me and I will reward you with an Gold White Pendant.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20931 - Crimson Tessera, a 20754 - Ethereal Sapphire, and a 20755 - Feathered Cape
	if (plugin::takeItems(20931 => 1, 20754 => 1, 20755 => 1)) {			#:: Magician Test of Clarification
		quest::say("Take this as your reward.");
		#:: Give a 1274 - Bracelet of Clarification
		quest::summonitem(1274);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20937 - Iron Disc, a 20756 - Gem of Empowerment, and a 20757 - Ceramic Mask
	elsif (plugin::takeItems(20937 => 1, 20756 => 1, 20757 => 1)) {			#:: Magician Test of Empowerment
		quest::say("Take this as your reward.");
		#:: Give a 2707 - Mask of Empowerment
		quest::summonitem(2707);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();	
	}
	#:: Match a 20870 - Efreeti Magi Staff, a 20966 - Sweet Nectar, a 20871 - Sphinx Crown, and a 20872 - Hazy Opal
	elsif (plugin::takeItems(20870 => 1, 20966 => 1, 20871 => 1, 20872 => 1)) {	#:: Magician Test of Gesticulationt
		quest::say("Take this as your reward.");
		#:: Give a 11650 - Staff of the Magister
		quest::summonitem(11650);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20944 - Hyaline Globe, a 20758 - Ivory Pendant, and a 20759 - Golden Coffer
	elsif (plugin::takeItems(20944 => 1, 20758 => 1, 20759 => 1)) {			#:: Magician Test of Shielding
		quest::say("Take this as your reward.");
		#:: Give a 14557 - Gold White Pendant
		quest::summonitem(14557);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
