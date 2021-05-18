sub EVENT_SPAWN {
	#:: Create a timer 'fenalla_depop' that triggers every 300 seconds (5 min)
	quest::settimer("fenalla_depop", 300);
}

sub EVENT_TIMER {
	#:: Match timer 'fenalla_depop'
	if ($timer eq "fenalla_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Children of the trees, friend and protector of nature. We the brothers and sisters to the wolves and bears. The call of the Great Pine has filled your heart and have found your way here to be tested. Do you wish to be tested in Nature, the art of the Bee, or the way of the Eagle?");
	}
	elsif ($text=~/nature/i) {
		quest::say("The test of Nature will show your devotion to and understanding of Mother Nature. Bring me an Efreeti Scimitar, a Lush Nectar, a Fire Sky Ruby, and a Storm Sky Opal to show your devotion. You will then recieve your reward.");
	}
	elsif ($text=~/bee/i) {
		quest::say("The bee is a busy little creature and you too must show industriousness like it. Bring me an Efreeti Statuette, a Wilder's Girdle, and a Piece of Divine Honeycomb to prove your understanding of the bee's art of work.");
	}
	elsif ($text=~/eagle/i) {
		quest::say("To soar like the eagle is your goal. To do so, you must bring me an Acidic Venom, an Ethereal Ruby, a Spiroc Elder's Totem, and a White-tipped Spiroc Feather. Perhaps then you will know what it means to soar upon the wind.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20739 - Efreeti Scimitar, a 20738 - Fire Sky Ruby, a 20965 - Lush Nectar, and a 20740 - Storm Sky Opal
	if (plugin::takeItems(20739 => 1, 20738 => 1, 20965 => 1, 20740 => 1)) {			#:: Druid Test of Nature
		quest::say("You have done well, young one.");
		#:: Give a 11683 - Espri
		quest::summonitem(11683);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20735 - Divine Honeycomb, a 20951 - Efreeti Statuette, and a 20734 - Wilder's Girdle
	elsif (plugin::takeItems(20735 => 1, 20951 => 1, 20734 => 1)) {					#:: Druid Test of the Bee
		quest::say("You have done well, young one.");
		#:: Give a 11684 - Honeycomb Belt
		quest::summonitem(11684);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20736 - Acidic Venom, a 20737 - Ethereal Ruby, a 20867 - Spiroc Elder's Totem, and a 20958 - White-tipped Spiroc Feather
	elsif (plugin::takeItems(20736 => 1, 20737 => 1, 20867 => 1, 20958 => 1)) {			#:: Druid Test of the Eagle
		quest::say("You have done well, young one.");
		#:: Give a 14555 - Spiroc Banisher Focus
		quest::summonitem(14555);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
