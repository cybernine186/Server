sub EVENT_SPAWN {
	#:: Create a timer 'enderbite_depop' that triggers every 300 seconds (5 min)
	quest::settimer("enderbite_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'enderbite_depop'
	if ($timer eq "enderbite_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! I have three tests from which you can choose from. They are Disillusion, Memorization, and Incapacitation.");
	}
	elsif ($text=~/disillusion/i) {
		quest::say("Disillusion it is. Proceed upward through the sky and return to me a Harpy Statuette, a Nebulous Sapphire, and an Adamintium Earring. This will prove your abilities to me and I will reward you with an Earring of Displacement.");
	}
	elsif ($text=~/memorization/i) {
		quest::say("Memorization it is. Proceed upward through the sky and return to me a Carmine Spiroc Feather, a Ganoric Poison, and a Glowing Necklace. This will prove your abilities to me and I will reward you with a Necklace of Whispering Winds.");
	}
	elsif ($text=~/incapacitation/i) {
		quest::say("Incapacitation it is. Proceed upward through the sky and return to me an Efreeti Wind Staff, some Sweet Nectar, a Black Sky Diamond, and a Large Sky Sapphire. This will prove your abilities to me and I will reward you with the Staff of Warding Winds.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20774 - Adamantium Earring, a 20952 - Harpy Statuette, and a 20802 - Nebulous Sapphire
	if (plugin::takeItems(20774 => 1, 20952 => 1, 20802 => 1)) {				#:: Enchanter Test of Disillusion
		quest::say("Good. Take this as your reward.");
		#:: Give a 14559 - Earring of Displacement
		quest::summonitem(14559);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20959 - Carmine Spiroc Feather, a 20775 - Ganoric Poison, and a 20776 - Glowing Necklace
	elsif (plugin::takeItems(20959 => 1, 20775 => 1, 20776 => 1)) {				#:: Enchanter Test of Memorization
		quest::say("Good. Take this as your reward.");
		#:: Give a 14558 - Necklace of Whispering Winds
		quest::summonitem(14558);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20777 - Black Sky Diamond, a 20779 - Efreeti Wind Staff, a 20778 - Large Sky Sapphire, and a 20966 - Sweet Nectar
	elsif (plugin::takeItems(20777 => 1, 20779 => 1, 20778 => 1, 20966 => 1)) {		#:: Enchanter Test of Incapacitation
		quest::say("Good. Take this as your reward.");
		#:: Give a 27711 - Rod of the Protecting Winds
		quest::summonitem(27711);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
