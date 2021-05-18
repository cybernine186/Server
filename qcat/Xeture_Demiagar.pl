sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_ENTER {
	#:: Match a 18716 - Tattered Note
	if (plugin::check_hasitem($client, 18716)) { 
		$client->Message(15,"As you orient yourself amongst the filth and decay of the catacombs, a menacing figure turns to address you. 'I am Xeture Demiagar. Should you wish to dedicate your pathetic life to the way of Bertoxxulous, read the note in your inventory and hand it to me to begin your training.'");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		#:: Removed quest indicator for "serve his will"
		quest::say("I have much to do here for the defense of our Temple and the appeasing of our patron Bertoxxulous, the Plague Lord. If the Plague Lord has gifted you with the desire to serve his will as a priest of the Bloodsabers I will assist in your training. If not, then leave me now and do not interrupt me again.");
	}
#::	elsif ($text=~/serve his will/i) {
#::		quest::say("By spreading the disease, decay, and destructive powers of the Plague Lord you will in turn be gifted with great insight and power. First however you must learn to survive in this city, surrounded by those who would see you destroyed for your faith. Take this note to Torin Krentar. He will instruct you on how to acquire a suit of armor to protect you from the weapons of our [enemies].");
#::		20207 - Note to Torin Krentar
#::		quest::summonitem(20207);
#::	}
#::	elsif ($text=~/enemies/i) {
#::		quest::say("The self-righteous ruler of this city, Antonius Bayle IV, is backed by the Knights of Thunder, paladins and clerics of the Storm Lord Karana, and the Temple Life, paladins and clerics of the Prime-Healer, Rodcet Nife. Be wary when not within the security of our temple here in the Qeynos Catacombs, should the Qeynos Guards discover you allegiances they would have you executed. Once you have been properly armored return to me and I will give you [further instruction].");
#::	}
#::	elsif ($text=~/further instruction/i) {
#::		quest::say("The Priests of Life, those who claim allegiance to the Prime Healer, Rodcet Nife, have proven to be a large obstacle in our conversion of the people of Qeynos to the ways of the Plague Bringer. Lately a Priest of Life by the name of Rolon Banari has been campaigning amongst the beggars and sickly, a social group from which we have gained many converts. Find this meddling priest and bring me his head.");
#::	}
}

sub EVENT_ITEM {
	#:: Match a 18716 - Tattered Note
	if (plugin::takeItems(18716 => 1)) {
		quest::say("Hmmm. Another rat has found its way to my doorstep, huh? Well, we may have use for you. Go find Rihtur, maybe he has an errand for you.");
		#:: Give a 13598 - Ruined Training Tunic*
		quest::summonitem(13598);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(221, 100);		#:: + Bloodsabers
		quest::faction(262, -15);		#:: - Guards of Qeynos
		quest::faction(296, 10);		#:: + Opal Darkbriar
		quest::faction(341, -25);		#:: - Priest of Life
		quest::faction(230, 5);			#:: + Corrupt Qeynos Guards
		#:: Grant a small amount of experience
		quest::exp(100);
	}
#::	#:: Match a 20197 - Rolon Banari's Head
#::	elsif (plugin::takeItems(20197 => 1)) {
#::		quest::say("You have done well, $name. Take this Rusty Bloodsaber Mace to a forge and clean it up with a Sharpening Stone. It may take you several attempts to get all the rust off if you are not familiar with the process. Once that is done take the Refined Bloodsaber Mace to Torin Krentar with a Giant King Snake Skin and he will put the finishing touches on the weapon.");
#::		#:: Give a 20198 - Rusty Bloodsaber Mace
#::		quest::summonitem(20198);
#::	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
