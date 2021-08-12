sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome, $name. I am Deadet Losaren, faithful priest of Karana. You appear to be in search of [guidance] or perhaps you are merely a [visitor to the temple of thunder] wishing the blessing of [holy armor]?");
	}
	elsif ($text=~/guidance/i) {
		quest::say("So it is guidance you seek. You will begin on the bottom rung. There is much more to our temple than the bashing of foes. We will need you to [collect donations].");
	}
	elsif ($text=~/collect donations/i) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("Then you are a new acolyte. Take this Chest of Faith into Qeynos and Qeynos Hills. Find me six residents will to donate to the Temple of Thunder. Combine these donations within the Chest of Faith and return it to me. Do so and I shall reward you with the spell 'Ward Undead.' Now go and spread the Word of Karana.");
			#:: Give a 17925 - Chest of Faith
			quest::summonitem(17925);
		}
		else {
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		}
	}
	elsif ($text=~/visitor to the temple/i) {
		quest::say("Then feel free to look around and speak with the priests and paladins of Thunder. May you find ways to serve the Rainkeeper.");
	}
	elsif ($text=~/holy armor/i) {
		quest::say("Holy Armor? I offer the blessing of Holy Armor to members in good standing of the Knights of Thunder. I must charge ten gold for the service. [Components] are expensive these days!");
	}
	elsif ($text=~/components/i) {
		quest::say("Components are required for my daily tribute to the Rainkeeper. It is he whose power flows from my body. I require a faithful acolyte to [gather the required items].");
	}
	elsif ($text=~/gather the required items/i) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("Very noble of you. Take this chest. I will require it to be filled with flame beetle eyes. Four normal beetles and four [Kerra Isle beetles]. Combine these items within the chest and return it to me. I shall reward you with the protection of Holy Armor.");
			#:: Give a 17934 - Beetle Eye Chest
			quest::summonitem(17934);
		}
		else {
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
		}
	}
	elsif ($text=~/kerra isle beetles/i) {
		quest::say("Kerra Isle beetles are normally found in the vicinity of the Kerra catpeople. They can be found in Kerra Ridge, but a closer and perhaps safer location would be on the island between Antonica and Odus. The outcast catpeople of that island are far less dangerous.");
	}
}

sub EVENT_ITEM {
	#:: Match 10 gold
	if (plugin::takeCoin(0, 0, 10, 0)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("This should help you remain safe.");
			#:: Cast spell 11 - Holy Armor
			$npc->CastSpell(11, $userid);
		}
		else {
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
			#:: Return unused money
			quest::givecash(0, 0, 10, 0);
		}
	}
	#:: Match a 13395 - Beetle Eye Chest
	elsif (plugin::takeItems(13395 => 1)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) { 
			quest::say("You have done well. Karana is pleased. I cannot say the same for the cat people. I now bestow upon you the knowledge of Holy Armor. Study the words and soon the power shall be bestowed upon you by the greatness that is the Rainkeeper.");
			#:: Give a 15011 - Spell: Holy Armor
			quest::summonitem(15011);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(280, 10);		#:: + Knights of Thunder
			quest::faction(221, -10);		#:: - Bloodsabers
			quest::faction(341, 7);			#:: + Priests of Life
			quest::faction(262, 7);			#:: + Guards of Qeynos
			#:: Grant a small amount of experience
			quest::exp(500);
			#:: Create a hash for storing cash - 5 to 10cp
			my %cash = plugin::RandomCash(5,10);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
			#:: Return a 13395 - Beetle Eye Chest
			quest::summonitem(13395);
		}
	}
	#:: Match a 13289 - Chest of Faith
	elsif (plugin::takeItems(13289 => 1)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("You have done supremely well, my young acolyte of Thunder. For your great service to the Temple of Thunder. Now go and cast the storm into the populace of Antonica.");
			#:: Give a 15218 - Spell: Ward Undead
			quest::summonitem(15218);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(280, 10);		#:: + Knights of Thunder
			quest::faction(221, -10);		#:: - Bloodsabers
			quest::faction(341, 7);			#:: + Priests of Life
			quest::faction(262, 7);			#:: + Guards of Qeynos
			#:: Grant a small amount of experience
			quest::exp(500);
		}
		else {
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
			#:: Return a 13289 - Chest of Faith
			quest::summonitem(13289);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
