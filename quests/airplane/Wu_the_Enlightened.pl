sub EVENT_SPAWN {
	#:: Create a timer 'wu_depop' that triggers every 300 seconds (5 min)
	quest::settimer("wu_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'wu_depop'
	if ($timer eq "wu_depop") {
		quest::stoptimer("wu_depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings Warrior of mind and body. To prove your worth to me, you must complete a test. Which test do you wish to take? I will permit you to take the test of Tears, Fists, or Tranquility.");
	}
	elsif ($text=~/tears/i) {
		quest::say("The test of tears involves knowing when to release, and when to provide a shoulder for another. Bring me a Spiroc Statuette, a Spiroc Talon, and a Silken Wrap. I will teach you the way.");
	}
	elsif ($text=~/fists/i) {
		quest::say("A monk must know when to use his or her fists, and when to use ones mind. You must decide in this endevour, which you shall use. Return to me, once you have found them, a pair of Brass Knuckles, a White Spiroc Feather, an Emerald Amethyst, and a Nebulous Sapphire.");
	}
	elsif ($text=~/tranquility/i) {
		quest::say("Ah, the test of tranquility. Only the tranquil monk can achieve enlightenment. Are you such an individual? Time shall tell. Retrieve these items for me. Bring an Aged Nectar, a Writ of Quellious, and a Glowing Diamond and we shall asses your ability.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20800 - Silken Wrap, a 20954 - Spiroc Statuette, and a 20799 - Spiroc Talon
	if (plugin::takeItems(20800 => 1, 20954 => 1, 20799 => 1)) {				#:: Monk Test of Tears
		quest::say("You have moved closer to enlightenment.");
		#:: Give a 1283 - Ton Po's Shoulder Wraps
		quest::summonitem(1283);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20803 - Brass Knuckles, a 20801 - Ethereal Amethyst, a 20802 - Nebulous Sapphire, and a 20960 - White Spiroc Feather
	elsif (plugin::takeItems(20803 => 1, 20801 => 1, 20802 => 1, 20960 => 1)) {		#:: Monk Test of Fists
		quest::say("You have moved closer to enlightenment.");
		#:: Give a 11690 - Wu's Tranquil Fist
		quest::summonitem(11690);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20967 - Aged Nectar, a 20804 - Decree of Quellious, and a 20805 - Tear of Quellious
	elsif (plugin::takeItems(20967 => 1, 20804 => 1, 20805 => 1)) {				#:: Monk Test of Tranquility
		quest::say("You have moved closer to enlightenment.");
		#:: Give a 11698 - Golden Sash of Tranquility
		quest::summonitem(11698);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
