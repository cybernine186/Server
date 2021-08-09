sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, adventurer!  A mighty warrior such as yourself deserves only the finest in armor and we here at Firepride's were trained by the finest dwarven smiths.  We shall be branching out and crafting [other items] soon, also.");
	}
	elsif ($text=~/other items/i) {
		quest::say("Well, soon I shall be showing my fantastic art in weapons making. I would hate to have the good people of Qeynos continue purchasing inferior weapons from that so-called blacksmith at [Ironforge Estates].");
	}
	elsif ($text=~/ironforge estates/i) {
		quest::say("The Ironforge family has called Qeynos their own for far too long. He was never trained in the dwarven techniques as I was. He will not be cornering the weapons market very much longer.");
	}
	elsif ($text=~/tax collection/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			quest::say("Oh I see, Vicus has got some other sap to do his work. Fine. Here are your stinking taxes. If Kane were in charge, things would be different around here.");
			#:: Give a 13170 - Firepride's Tax Payment
			quest::summonitem(13170);
			#:: Set faction
			quest::faction(291,-1);		#:: - Merchants of Qeynos
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 13129 - Hurrieta's Tunic
	if (plugin::takeItems(13129 => 1)) {
		quest::say("Ha! This is great. Here's your money, murderer! Hope the guards don't find you. Now get lost! Take the tunic. Maybe Garuc will reward you for such a vile deed. I sure don't want to keep it around here.");
		#:: Give a 13134 - Hurrieta's Bloody Dress
		quest::summonitem(13134);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(230, 20);		#:: + Corrupt Qeynos Guards
		quest::faction(262, -3);		#:: - Guards of Qeynos
		quest::faction(273, 3);			#:: + Kane Bayle
		quest::faction(223, 2);			#:: + Circle of Unseen Hands
		quest::faction(221, 3);			#:: + Bloodsabers
		#:: Grant a small amount of experience based on level
		$client->AddLevelBasedExp(15, 1);
		#:: Create a hash for storing cash - 80 to 100cp
		my %cash = plugin::RandomCash(80,100);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
