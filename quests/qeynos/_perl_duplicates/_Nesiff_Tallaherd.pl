sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name! Nesiff Tallaherd, owner and operator of Nesiff's Wooden Weapons, at your service. I am the finest woodworker in all of Qeynos. Even the Qeynos Guard uses my arrows, thanks to [Guard Weleth].");
	}
	elsif ($text=~/guard weleth/i) {
		quest::say("Guard Weleth is like a son to me. He is responsible for purchasing supplies for the Qeynos Guard. He buys arrows from me. He is usually stationed near the North Gate.");
	}
	elsif ($text=~/tax collection/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			quest::say("Tax time again already?? It seems like I just paid yesterday.. High taxes and low sales mean I won't be able to stay in business much longer. Good thing ol' Weleth is taking care of me. Here are my taxes.");
			#:: Give a 13173 - Tallaherd's Tax Payment
			quest::summonitem(13173);
			#:: Set faction
			quest::faction(291, -1);		#:: - Merchants of Qeynos
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 18012 - Claim Check
	if (plugin::takeItems(18012 => 1)) {
		quest::say("Oh. Vesteri sent you? Here you go. I hope Te'Anara likes it.");
		#:: Give a 13864 - Wooden Statue
		quest::summonitem(13864);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(291, 1);			#:: + Merchants of Qeynos
		quest::faction(223, -1);		#:: - Circle Of Unseen Hands
		quest::faction(219, 1);			#:: + Antonius Bayle
		quest::faction(229, 1);			#:: + Coalition of Tradefolk
		quest::faction(262, 1);			#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Match a 13925 - Crate of Defective Arrows
	elsif (plugin::takeItems(13925 => 1)) {
		quest::say("Oh dear. I hope my mistake will not bring too much grief down on poor Weleth. He was told not to order arrows from me after the last time I fouled up their shipment. But Weleth knew I needed the account to stay in business. Could you please rush this new invoice to him right away? Thank you.");
		#:: Give a 18824 - Slip of Parchment
		quest::summonitem(18824);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(291, 5);			#:: + Merchants of Qeynos
		quest::faction(223, -1);		#:: - Circle Of Unseen Hands
		quest::faction(219, 1);			#:: + Antonius Bayle
		quest::faction(229, 1);			#:: + Coalition of Tradefolk
		quest::faction(262, 1);			#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
