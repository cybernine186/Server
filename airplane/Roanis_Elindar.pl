sub EVENT_SPAWN {
	#:: Create a timer 'roanis_depop' that triggers every 300 seconds (5 min)
	quest::settimer("roanis_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'roanis_depop'
	if ($timer eq "roanis_depop") {
		quest::stoptimer("roanis_depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! I offer to you three challenges. Summoning, Interpretation, and Displacement.  Please choose one of these.");
	}
	elsif ($text=~/summoning/i) {
		quest::say("Summoning it is. Proceed upward through the sky and return to me a Harpy Statuette, a Finely Woven Cloth Amice, and a Large Diamond. This will prove your abilities to me and I will reward you with a Drake Hide Amice.");
	}
	elsif ($text=~/interpretation/i) {
		quest::say("Interpretation it is. Proceed upward through the sky and return to me a Carmine Spiroc Feather, a Blood Sky Amethyst, and a Golden Efreeti Ring. This will prove your abilities to me and I will reward you with the Duennan Shielding Ring.");
	}
	elsif ($text=~/displacement/i) {
		quest::say("Displacement it is. Proceed upward through the sky and return to me some Sweet Nectar, the Crown of Elemental Mastery, a Large Opal, and Djinni's Stave. This will prove your abilities to me and I will reward you with the Staff of Elemental Mastery.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20952 - Harpy Statuette, a 20760 - Finely Woven Cloth Amice, and a 20761 - Large Diamond
	if (plugin::takeItems(20952 => 1, 20760 => 1, 20761 => 1)) {				#:: Magician Test of Summoning
		quest::say("Take this.");
		#:: Give a 2708 - Drake-Hide Amice
		quest::summonitem(2708);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20959 - Carmine Spiroc Feather, a 20762 - Blood Sky Amethyst, and a 20763 - Golden Efreeti Ring
	elsif (plugin::takeItems(20959 => 1, 20762 => 1, 20763 => 1)) {				#:: Magician Test of Interpretation
		quest::say("Take this.");
		#:: Give a 11687 - Duennan Shielding Ring
		quest::summonitem(11687);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20966 - Sweet Nectar, a 20764 - Crown of Elemental Mastery, a 20766 - Large Opal, and a 20765 - Djinni Stave
	elsif (plugin::takeItems(20966 => 1, 20764 => 1, 20766 => 1, 20765 => 1)) { 		#:: Magician Test of Displacement
		quest::say("Take this.");
		#:: Give a 11568 - Staff of Elemental Mastery: Air
		quest::summonitem(11568);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
