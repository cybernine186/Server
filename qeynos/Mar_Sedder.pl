sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name.  What brings you to the Tin Soldier?  We have the finest in previously owned weapons and armor.  Feel free to browse.");
	}
	elsif ($text=~/tax collection/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			quest::say("Here are the taxes, $name. Boy, you call the guards and they take their time to show up but be a few days late on your taxes and they send the goons after you. Sheesh!");
			#:: Give a 13171 - Sedder's Tax Payment
			quest::summonitem(13171);
			#:: Set faction
			quest::faction(291,-1);		#:: - Merchants of Qeynos
		}
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
