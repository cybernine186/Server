sub EVENT_SPAWN {
	#:: Create a timer 'rayne_depop' that triggers every 300 seconds (5 min)
	quest::settimer("rayne_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'rayne_depop'
	if ($timer eq "rayne_depop") {
		quest::stoptimer("rayne_depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! Do you wish to begin your test of Deception, Stealth, or Cunning?");
	}
	elsif ($text=~/deception/i) {
		quest::say("Deception it is. Proceed upward through the sky and return to me the honeyed nectar, a bixie stinger, a lightning rod, and a bloodsky sapphire for the test of deception and earn Ebonsting, caller of lightning.");
	}
	elsif ($text=~/stealth/i) {
		quest::say("Stealth is a must. Travel among the residents of the sky and bring to me a Pegasus Statuette, a Prismatic Sphere, and a Fine Wool Cloak. In return, The Scintillating Bracer of Protection shall be yours.");
	}
	elsif ($text=~/cunning/i) {
		quest::say("Cunning, the true source of all rogue power. Plan and succeed above us and return to me a bronze disc, a jester's mask, and some red face paint to compelte the test of cunning. The transparent mask shall be yours if you do so.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20963 - Honeyed Nectar, a 20994 - Bixie Stinger, a 20995 - Lightning Rod, and a 20996 - Bloodsky Sapphire
	if (plugin::takeItems(20963 => 1, 20994 => 1, 20995 => 1, 20996 => 1)) {	#:: Rogue Test of Deception
		quest::say("Very good. Here's your reward.");
		#:: Give a 11677 - Ebonsting
		quest::summonitem(11677);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20949 - Pegasus Statuette, a 20990 - Prismatic Sphere, and a 20991 - Fine Wool Cloak
	elsif (plugin::takeItems(20949 => 1, 20990 => 1, 20991 => 1)) {			#:: Rogue Test of Stealth
		quest::say("Very good. Here's your reward.");
		#:: Give a 2701 - Scintillating Bracer of Protection
		quest::summonitem(2701);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20935 - Bronze Disc, a 20987 - Jester's Mask, and a 20986 - Red Face Paint
	elsif (plugin::takeItems(20935 => 1, 20987 => 1, 20986 => 1)) {			#:: Rogue Test of Cunning
		quest::say("Very good. Here's your reward.");
		#:: Give a 2702 - Transparent Mask
		quest::summonitem(2702);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
