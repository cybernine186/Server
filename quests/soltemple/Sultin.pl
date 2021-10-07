sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I am Sultin - keeper of the three [Incandescent]s of power and the [Rod] of Insidious Glamour. If you are an Enchanter, perhaps we can deal.");
	}
	elsif ($text=~/incandescent/i) {
		quest::say("There are three Incandescent items of power - [Wand], [Mask] and [Gloves]. Are you [interested] in any of them?");
	}
	elsif ($text=~/interested in the wand/i) {
		quest::say("Ahh, the Incandescent Wand. If you will get the components to make another, I will give you mine. I will need a Pouch of Silver Dust, found on the dusty Werebat in the Estate of Unrest. I will also need a Silver wand, found on a Silvered Guard in the Temple of Cazic Thule. This wand will not be enchanted - you will need to pay Esmirella of the Northern Karana Gypsy Camp 50 gold to enchant it for you. When the Wand is fully enchanted, bring it and the pouch to me and I will give you the Incandescent Wand.");
	}
	elsif ($text=~/interested in the mask/i) {
		quest::say("An item of power - the Incandescent Mask. If you will bring me the components to make another, I will give you an Incandescent Mask. I will need a Glowing Mask, found on the skeletal monk in the caverns of Guk. I will also need all three Runes of Fortune. One Rune can be found on the Dark Elf Enynti in the Chasm below Castle Mistmoore. The other two can each be purchased for 50 golden coins each - one from Mizr N`Mar in the Neriak City Library and the other from Madam Serena in the city of Qeynos. Bring me all three Runes and the Glowing Mask and I will give you your reward.");
	}
	elsif ($text=~/interested in the gloves/i) {
		quest::say("My personal favorite - Incandescent Gloves. If you bring me the components to make another pair, I will give you my gloves. Incandescent Gloves are made by sewing together four other sets of gloves. Glowing Gloves can be found on our mortal enemies - the Shadowed Men. Radiant Gloves can be found on Radiant in the Feerrott. Enchanted and Gleaming gloves can be purchased for 50 golden coins from Tizina of the Lavastrom Gypsies and a bloodstone from Tarn Vislin of HighKeep. Bring me all four sets of gloves and I will give you a pair of Incadescent ones.");
	}
	elsif ($text=~/rod/i) {
		if ($text=~/interested/i) {
			quest::say("If I am to give you this rod, you must bring me the parts to make another. I will need the Golden Rod from the froglok priest in Guk, as well as a Shining Stone from our mortal enemies, the Shadowed Men. Once you have obtained the Shining Stone, you will need to get it enchanted. Cynthia of the Rathe Mountain Gypsy Clan will enchant the Shining Stone for you - give it to her with 50 golden coins. When the Stone is fully enchanted, bring it and the rod to me and I will give you a Rod of Insidious Glamour.");	
		}
		else {
			quest::say("I am keeper of the Rod of Insidious Glamour - a device of guile and deceit. The rod will increase the Charisma of whomever holds it. Are you [interested] in obtaining the [rod]?");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 10087 - Glowing Glamour Stone, and a 6337 - Golden Rod
	if (plugin::takeItems(10087 => 1, 6337 => 1)) {
		quest::say("Well done, adventurer. You have kept your part of the bargain, so I keep mine. Here is your rod.");
		#:: Give a 6329 - Rod of Insidious Glamour
		quest::summonitem(6329);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 12240 - Pouch of Silver Dust, and a 6340 - Glowing Silver Wand
	elsif (plugin::takeItems(12240 => 1, 6340 => 1)) {
		quest::say("I see that you are resourceful... you have earned your incandescent wand.");
		#:: Give a 6334 - Incandescent Wand
		quest::summonitem(6334);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 2353 - Glowing Gloves, a 2354 - Enchanted Gloves, a 2355 - Gleaming Gloves, and a 2356 - Radiant Gloves
	elsif (plugin::takeItems(2353 => 1, 2354 => 1, 2355 => 1, 2356 => 1)) {
		quest::say("Four pairs of gloves you have given me ? I will give you one pair in return. We shall see who had the better deal.");
		#:: Give a 2351 - Incandescent Gloves
		quest::summonitem(2351);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 2352 - Glowing Mask, a 10530 - Rune of Fortune, a 10531 - Rune of Fortune, and a 10532 - Rune of Fortune
	elsif (plugin::takeItems(2352 => 1, 10530 => 1, 10531 => 1, 10532 => 1)) {
		quest::say("Fortune favors you .. as will this mask.");
		#:: Give a 2350 - Incandescent Mask
		quest::summonitem(2350);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
