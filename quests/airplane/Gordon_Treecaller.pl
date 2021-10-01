sub EVENT_SPAWN {
	#:: Create a timer 'gordon_depop' that triggers every 300 seconds (5 min)
	quest::settimer("gordon_depop",300);
}

sub EVENT_TIMER {
	#:: Match the timer 'gordon_depop'
	if ($timer eq "gordon_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello $name, I can only hope that my disturbance was necessary. Ahh, you seem to be decently adept with a blade. Would you like to be tested in the element of thunder, the blade, or the art of ranged attack?");
	}
	elsif ($text=~/element of thunder/i) {
		quest::say("One of my greatest allies indeed. Thunder can be very powerful if used properly. Bring me a djinni statuette, a spiroc thunder totem, and a white gold earring. Then you will know the true power of nature.");
	}
	elsif ($text=~/blade/i) {
		quest::say("Very good choice, my blade is my best friend and yours will be as well if you can complete this task. Retrieve an efreeti long sword, an emerald spiroc feather, some bitter honey, and a circlet of thorns. Be careful with the honey, if it is tainted the blade will not come to life.");
	}
	elsif ($text=~/art of ranged attack/i) {
		quest::say("Many of the fools on Norrath don’t realize how powerful a good bow can be. Many dread wolves have met their fate from my bow and you can have the same power if you can bring me back these items. Efreeti war bow, thickened nectar, a sphinx tallow, and a shimmering pearl.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20955 - Djinni Statuette, a 20856 - Spiroc Thunder Totem, and a 20857 - White Gold Earring
	if (plugin::takeItems(20955 => 1, 20856 => 1, 20857 => 1)) {				#:: Ranger Test of the Element of Thunder
		quest::say("Take this as your reward.");
		#:: Grant a 14568 - Thunderforged Earring
		quest::summonitem(14568);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20859 - Bitter Honey, a 20860 - Circlet of Brambles, a 20858 - Efreeti Long Sword, and a 20962 - Emerald Spiroc Feather
	elsif (plugin::takeItems(20859 => 1, 20860 => 1, 20858 => 1, 20962 => 1)) { 		#:: Ranger Test of the Blade
		quest::say("Take this as your reward.");
		#:: Give a 27732 - Arydryidriyorn
		quest::summonitem(27732);
 		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20861 - Efreeti War Bow, a 20969 - Thickened Nectar, a 20862 - Sphinx Tallow, and a 20863 - Shimmering Pearl
	elsif (plugin::takeItems(20861 => 1, 20969 => 1, 20862 => 1, 20863 => 1)) {		#:: Ranger Test of the Art of Ranged Attack
		quest::say("Take this as your reward.");
		#:: Give a 11696 - Windstriker
		quest::summonitem(11696);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
