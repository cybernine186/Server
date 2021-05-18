sub EVENT_SPAWN {
	#:: Create a timer 'gina_depop' that triggers every 300 seconds (5 min)
	quest::settimer("gina_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'gina_depop'
	if ($timer eq "gina_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. I will test you in the tests of might, health, and sight. Which will it be?");
	}
	elsif ($text=~/might/i) {
		quest::say("The test of might It Is. Go find an Auburn Tessera, a Drake Fang and a Leather Chord. Bring them to me when you have them all and I shall reward you.");
	}
	elsif ($text=~/health/i) {
		quest::say("The test of health Is difficult. I am sure that you will find It a challenge. Bring to me a Platinum Disc, some Ethereal Amber, a Shimmering Amber and finally a Ceremonial Belt. Return them all to me at once and you shall have your just reward.");
	}
	elsif ($text=~/sight/i) {
		quest::say("So you wish to take the test of sight do you? Get me a Phosphoric Globe, a Sphinx Hide and a Light Damask Mantle. Give them all to me at the same time and I shall reward you well.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20934 - Auburn Tessera, a 20834 - Drake Fang, and a 20835 - Leather Cord
	if (plugin::takeItems(20934 => 1, 20834 => 1, 20835 => 1)) {			#:: Shaman Test of Might
		quest::say("Excellent! Take this as your reward.");
		#:: Give a 14566 - Drake Fang Amulet
		quest::summonitem(14566);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20940 - Platinum Disc, a 20836 - Ethereal Amber, a 20837 - Shimmering Amber, and a 20838 - Ceremonial Belt
	elsif (plugin::takeItems(20940 => 1, 20836 => 1, 20837 => 1, 20838 => 1)) { 	#:: Shaman Test of Health
		quest::say("Excellent! Take this as your reward.");
		#:: Give a 27727 - Bracelet of the Spirits
		quest::summonitem(27727);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20947 - Phosphoric Globe, a 20839 - Sphinx Hide, and a 20840 - Light Damask Mantle
	elsif (plugin::takeItems(20947 => 1, 20839 => 1, 20840 => 1)) {			#:: Shaman Test of Sight
 		quest::say("Excellent! Take this as your reward.");
		#:: Give a 27728 - Fairy-Hide Mantle
 		quest::summonitem(27728);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
