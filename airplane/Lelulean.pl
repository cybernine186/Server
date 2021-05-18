sub EVENT_SPAWN {
	#:: Create a timer 'lelulean_depop' that triggers every 300 seconds (5 min)
	quest::settimer("lelulean_depop", 300);
}

sub EVENT_TIMER {
	#:: Match timer 'lelulean_depop'
	if ($timer eq "lelulean_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! I have three tests from which you can choose from. They are Illusion, Metamorphism, and Deception.");
	}
	elsif ($text=~/illusion/i) {
		quest::say("Illusion it is. Proceed upward through the sky and return to me a Crimson Tessera, a Darkstone Emerald, and a Finely Woven Gold Cord. This will prove your abilities to me and I will reward you with a Cord of Sphinx Hair.");
	}
	elsif ($text=~/metamorphism/i) {
		quest::say("Metamorphism it is. Proceed upward through the sky and return to me a Silver Disk, a Bluish Stone, and a Light Cloth Mantle. This will prove your abilities to me and I will reward you with the Wind Walker's Mantle.");
	}
	elsif ($text=~/deception/i) {
		quest::say("Deception it is. Proceed upward through the sky and return to me a Rugous Globe, a Sky Pearl, and a Silken Mask. This will prove your abilities to me and I will reward you with an Ivory Mask.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20931 - Crimson Tessera, a 20767 - Darkstone Emerald, and a 20768 - Finely Woven Cloth Cord
	if (plugin::takeItems(20931 => 1, 20767 => 1, 20768 => 1)) {			#:: Enchanter Test of Illusion
		quest::say("Excellent work!");
		#:: Give a 1277 - Sphinx Hair Cord
		quest::summonitem(1277);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20769 - Bluish Stone, a 20770 - Light Cloth Mantle, a 20938 - Silver Disc
	elsif (plugin::takeItems(20769 => 1, 20770 => 1, 20938 => 1)) {			#:: Enchanter Test of Metamorphism
		quest::say("Excellent work!");
		#:: Give a 1276 - Wind Walker's Mantle
		quest::summonitem(1276);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20945 - Rugous Globe, a 20772 - Silken Mask, and a 20771 - Sky Pearl
	elsif (plugin::takeItems(20945 => 1, 20772 => 1, 20771 => 1)) {			#:: Enchanter Test of Deception
		quest::say("Excellent work!");
		#:: Give a 1275 - Ivory Mask
		quest::summonitem(1275);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
