sub EVENT_SPAWN {
	#:: Create a timer 'clarisa_depop' that triggers every 300 seconds (5 min)
	quest::settimer("clarisa_depop", 300);
}


sub EVENT_TIMER {
	#:: Match timer 'clarisa_depop'
	if ($timer eq "clarisa_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i){
		quest::say("Hail and well met $name! I give the second half of the test of songs. If you are ready, choose between the tests of brass, wind, and harmony.");
	}
	elsif ($text=~/brass/i) {
		quest::say("Then bring back to me an Efreeti War Horn, a Saffron Spiroc Feather, Adamintium Bands, and a Glowing Diamond. Then I will give you the horn of disaster.");
	}
	elsif ($text=~/wind/i) {
		quest::say("Bring me an imp statuette, a dull stone, and an amulet of woven hair. Then I will give you the fae amulet.");
	}
	elsif ($text=~/harmony/) {
		quest::say("Working with the environment to enthrall those that listen to you is of the utmost importance to us. Go out and retrieve an efreeti war spear, some manna nectar, a nebulous emerald, and a nebulous diamond. Return these items to me and receive the harmonic spear as your reward.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20830 - Efreeti War Horn, a 20961 - Saffron Spiroc Feather, a 20828 - Adamantium Bands, and a 20829 - Glowing Diamond
	if (plugin::takeItems(20830 => 1, 20961 => 1, 20828 => 1, 20829 => 1)) { 				#:: Bard Test of Brass
		quest::say("Well done, $name. Here is your reward.");
		#:: Give a 27724 - Denon's Horn of Disaster
		quest::summonitem(27724);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20953 - Imp Statuette, a 20826 - Dull Stone, and a 20827 - Amulet of Woven Hair
	elsif (plugin::takeItems(20953 => 1, 20826 => 1, 20827 => 1)) { 					#:: Bard Test of Wind
		quest::say("Well done, $name. Here is your reward.");
		#:: Give a 14565 - Fae Amulet
		quest::summonitem(14565);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20831 - Efreeti War Spear, a 20968 - Manna Nectar, a 20832 - Nebulous Emerald, and a 20833 - Nebulous Diamond
	elsif (plugin::takeItems(20831 => 1, 20968 => 1, 20832 => 1, 20833 => 1)) { 				#:: Bard Test of Harmony
		quest::say("Well done, $name. Here is your reward.");
		#:: Give a 10852 - Harmonic Spear
		quest::summonitem(10852);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
