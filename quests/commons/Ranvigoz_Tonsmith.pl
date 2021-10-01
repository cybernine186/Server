sub EVENT_SAY {
	#:: Match if faction is Indifferent or better
	if ($faction <= 5) {
		if ($text=~/hail/i) {
			quest::say("Hail! I am Ranvigoz Tonsmith. My brother Timtok and I are some of the finest smiths this side of Kaladim. If you are interested we will happily [resize] your [Crafted Armor] down to a more manageable size.");
		}
		elsif ($text=~/resize/i) {
			quest::say("I will resize Crafted Bracers, Greaves, a Pauldron or a Breastplate. My brother will resize Crafted Gauntlets, a Vambrace, a Helm or Boots. Just give me the armor and I will resize it for you.");
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
		#:: Match a 4177 - Crafted Bracers
		if (plugin::takeItems(4177 => 1)) {
			quest::say("Here is your armor. I hope it fits better now.");
			#:: Give a 4185 - Small Crafted Bracers
			quest::summonitem(4185);
			#:: Set factions
			quest::faction(229, 10);		#:: + Coalition of Tradefolk
			quest::faction(281, 10);		#:: + Knights of Truth
			quest::faction(291, 10);		#:: + Merchants of Qeynos
			quest::faction(5015, 10);		#:: + Coalition of Tradefolk III
		}
		#:: Match a 4179 - Crafted Greaves
		elsif (plugin::takeItems(4179 => 1)) {
			quest::say("Here is your armor. I hope it fits better now.");
			#:: Summon 4187 - Small Crafted Greaves
			quest::summonitem(4187);
			#:: Set factions
			quest::faction(229, 10);		#:: + Coalition of Tradefolk
			quest::faction(281, 10);		#:: + Knights of Truth
			quest::faction(291, 10);		#:: + Merchants of Qeynos
			quest::faction(5015, 10);		#:: + Coalition of Tradefolk III
		}
		#:: Match a 4175 - Crafted Pauldron
		elsif (plugin::takeItems(4175 => 1)) {
			quest::say("Here is your armor. I hope it fits better now.");
			#:: Summon 4183 - Small Crafted Pauldron
			quest::summonitem(4183);
			#:: Set factions
			quest::faction(229, 10);		#:: + Coalition of Tradefolk
			quest::faction(281, 10);		#:: + Knights of Truth
			quest::faction(291, 10);		#:: + Merchants of Qeynos
			quest::faction(5015, 10);		#:: + Coalition of Tradefolk III
		}
		#:: Match a 4174 - Crafted Breastplate
		elsif (plugin::takeItems(4174 => 1)) {
			quest::say("Here is your armor. I hope it fits better now.");
			#:: Summon 4182 - Small Crafted Breastplate
			quest::summonitem(4182);
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
