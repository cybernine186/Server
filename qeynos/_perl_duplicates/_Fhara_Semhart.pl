sub EVENT_SAY {
	if ($text=~/tax collection/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			quest::say("Taxes? How can I afford more taxes? You tax us poor merchants right out of Qeynos. Freeport is looking better and better every day.");
			#:: Give a 13175 - Semhart's Tax Payment
			quest::summonitem(13175);
			#:: Set faction
			quest::faction(291,-1);		#:: - Merchants of Qeynos
		}
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
