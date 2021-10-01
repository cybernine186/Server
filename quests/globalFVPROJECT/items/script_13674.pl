sub EVENT_ITEM_CLICK_CAST {
	#:: Match if Item ID 11668 - Vibrating Gauntlets of Infuse
	if ($itemid == 11668) {
		#:: Cast 1824 - Transmute Hammer on self
		$client->CastSpell(1824, 0, $slotid, 0, 0);
		#:: Delete the 11668 - Vibrating Gauntlets of Infuse
		$client->NukeItem(11668);
		#:: Summon a 11669 - Vibrating Hammer of Infuse
		quest::summonitem(11669);
	}
	#:: Match if Item ID 11669 - Vibrating Hammer of Infuse
	elsif ($itemid == 11669) {
		#:: Cast 1823 - Transmute Gaunlets on self
		$client->CastSpell(1823, 0, $slotid, 0, 0);
		#:: Delete the 11669 - Vibrating Hammer of Infuse
		$client->NukeItem(11669);
		#:: Summon a 11668 - Vibrating Gauntlets of Infuse
		quest::summonitem(11668);
	}
}
