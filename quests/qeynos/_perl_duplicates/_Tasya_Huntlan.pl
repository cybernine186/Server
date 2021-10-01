sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name!  Are you just visiting Qeynos?  We have plenty of rooms available or, if your throat is parched, you can always visit Earron in our pub.");
	}
	elsif ($text=~/tax collection/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			quest::say("Taxes? Oh, that time again huh? Here you are. Give Vicus our best. I hear he is under the weather.");
			#:: Give a 13176 - Huntlan's Tax Payment
			quest::summonitem(13176);
			#:: Set faction
			quest::faction(291,-1);		#:: - Merchants of Qeynos
		}
	}
}

sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/Raffel_Minnmorn.pl
	if ($signal == 1) {
		quest::say("Yes.  He is staying here at the Lion's Mane Inn, but it is against regulations to give out room numbers.  I can tell you that he loves to see the sun rise over the ocean.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
