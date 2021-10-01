sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name!  Welcome to Fish's Ale. I am Fish Ranamer, owner of the joint.  Come in and have some brew but don't be startin' no trouble or Bruno will bust you open!");
	}
	elsif ($text=~/tax collection/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			quest::say("Taxes?! Taxes?! Tax me right out of business is what you folks are doing! Take your taxes and get out of my pub! Unless, of course, you care to buy some drinks...?");
			#:: Give a 13178 - Ranamer's Tax Payment
			quest::summonitem(13178);
			#:: Set faction
			quest::faction(291,-1);		#:: - Merchants of Qeynos
		}
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
