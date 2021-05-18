sub EVENT_SAY {
	#:: Match if faction is Indifferent or better
	if ($faction <= 5) {
		if ($text=~/hail/i) {
			quest::say("Hail! I am Timtok Tonsmith. My brother Ranvigoz and I are some of the finest smiths this side of Kaladim. If you are interested we will happily [resize] your [Crafted Armor] down to a more manageable size.");
		}
		elsif ($text=~/resize/i) {
			quest::say("I will resize Crafted Gauntlets, a Vambrace, a Helm or Boots. My brother will resize Crafted Bracers, Greaves, a Pauldrun or a Breastplate. Just give me the armor and I will resize it for you.");
		}
		elsif ($text=~/crafted armor/i) {
			quest::say("Crafted Armor is made by the Meadowgreen smiths. They can be found in the southern part of the Karanas.");
		}
	}
	else {
		quest::emote("will not speak to you, yet.");
	}
}

sub EVENT_ITEM {
	#:: Match if faction is Indifferent or better
	if ($faction <= 5) {
		#:: Match 4178 - Crafted Gauntlets
		if (plugin::takeItems(4178 => 1)) {
			quest::say("Here is your armor. I hope it fits better now.");
			#:: Give a 4186 - Small Crafted Gauntlets
			quest::summonitem(4186);
			#:: Set factions
			quest::faction(229, 10);		#:: + Coalition of Tradefolk
			quest::faction(281, 10);		#:: + Knights of Truth
			quest::faction(291, 10);		#:: + Merchants of Qeynos
			quest::faction(5015, 10);		#:: + Coalition of Tradefolk III
		}
		#:: Match a 4176 - Crafted Vambraces
		elsif (plugin::takeItems(4176 => 1)) {
			quest::say("Here is your armor. I hope it fits better now.");
			#:: Give a 4184 - Small Crafted Vambraces
			quest::summonitem(4184);
			#:: Set factions
			quest::faction(229, 10);		#:: + Coalition of Tradefolk
			quest::faction(281, 10);		#:: + Knights of Truth
			quest::faction(291, 10);		#:: + Merchants of Qeynos
			quest::faction(5015, 10);		#:: + Coalition of Tradefolk III
		}
		#:: Match a 4173 - Crafted Helm
		elsif (plugin::takeItems(4173 => 1)) {
			quest::say("Here is your armor. I hope it fits better now.");
			#:: Give a 4181 - Small Crafted Helm
			quest::summonitem(4181);
			#:: Set factions
			quest::faction(229, 10);		#:: + Coalition of Tradefolk
			quest::faction(281, 10);		#:: + Knights of Truth
			quest::faction(291, 10);		#:: + Merchants of Qeynos
			quest::faction(5015, 10);		#:: + Coalition of Tradefolk III
		}
		#:: Match 4180 - Crafted Plate Boots
		elsif (plugin::takeItems(4180 => 1)) {
			quest::say("Here is your armor. I hope it fits better now.");
			#:: Give a 4188 - Small Crafted Plate Boots
			quest::summonitem(4188);
			#:: Set factions
			quest::faction(229, 10);		#:: + Coalition of Tradefolk
			quest::faction(281, 10);		#:: + Knights of Truth
			quest::faction(291, 10);		#:: + Merchants of Qeynos
			quest::faction(5015, 10);		#:: + Coalition of Tradefolk III
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
