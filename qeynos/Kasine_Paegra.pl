sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("May the blessings of the Rainkeeper protect you in your travels. I am Kasine Paegra, keeper of the [Order of Thunder] medallions.");
	}
	elsif ($text=~/order of thunder/i) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("The Order of Thunder is the medal awarded to a Knight of Thunder who has proven himself superior to the average warrior. All knights and priests of Thunder have one, save for the youngest members. Along with the medal comes great respect. You might say the wearer becomes more charismatic. Should you find one, please return it to Kasine Paegra, unless told otherwise.");
		}
		else {
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		}
	}
	elsif ($text=~/enchant bonethunder/i) {
		quest::say("If you wish the power of the Rainkeeper to once again shine upon your weapon, you must hand me Bonethunder and 500 Gold Coins.");
	}
}

sub EVENT_ITEM {
	#:: This is a leftover from when the Bonethunder Staff only had one charge of Ward Undead
	#:: Match a 6358 - Bonethunder Staff and 500 gold coins
	if (plugin::takeItemsCoin(0,0,500,0, 6358 => 1)) {
		quest::say("The Rainkeeper has bestowed this weapon with power once more. Take it and defend our temple.");
		#:: Give a 6358 - Bonethunder Staff with 1 charge
		quest::summonitem(6358, 1);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, 50);		#:: + Knights of Thunder
		quest::faction(221, -50);		#:: - Bloodsabers
		quest::faction(341, 37);		#:: + Priests of Life
		quest::faction(262, 37);		#:: + Guards of Qeynos
	}
	#:: Match a 13288 - Order of Thunder [Drosco's Medal]
	elsif (plugin::takeItems(13288)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("You have returned an Order of Thunder which has been drained of all its power. I wonder how this could have happened. No doubt evil is behind this. Thank you for its return. I give you the blessings of Karana. Go and serve the Rainkeeper.");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(280, 20);	#:: + Knights of Thunder
			quest::faction(221, -20);	#:: - Bloodsabers
			quest::faction(341, 15);	#:: + Priests of Life
			quest::faction(262, 15);	#:: + Guards of Qeynos
			#:: Grant a small amount of experience
			quest::exp(500);
			#:: Cast spell 200 - Minor Healing
			$npc->CastSpell(200, $userid);
		}
		else {
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
			#:: Return a 13288 - Order of Thunder [Drosco's Medal]
			quest::summonitem(13288);
		}
	}
	#:: Match a 13287 - Order of Thunder [Order of Thunder Medal]
	elsif (plugin::takeItems(13287)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("You are a very honorable person. You have returned an Order of Thunder which you truly do not need. I give you the protection of the Rainkeeper to watch over you. May it keep you from harm. Go and serve.");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(280, 10);	#:: + Knights of Thunder
			quest::faction(221, -10);	#:: - Bloodsabers
			quest::faction(341, 7);		#:: + Priests of Life
			quest::faction(262, 7);		#:: + Guards of Qeynos
			#:: Grant a small amount of experience
			quest::exp(500);
			#:: Cast spell 11 - Holy Armor
			$npc->CastSpell(11, $userid);
		}
		else {
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
			#:: Return a 13287 - Order of Thunder [Order of Thunder Medal]
			quest::summonitem(13287);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
