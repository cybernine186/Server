sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Grikk.. Please leave me be. I but a humble forager. My people are starving.");
	}
} 

sub EVENT_ITEM {
	#:: Match a 13375 - Empty Vial
	if (plugin::takeItems(13375 => 1)) {
		quest::say("Grrrikk.. This is Groak's vial!! He must be in danger. Here. Return this liquid to him. Be quick!");
		#:: Give a 13376 - Ochre Liquid
		quest::summonitem(13376);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(251, 1);		#:: + Frogloks of Guk
		#:: Grant a small amount of experience based on level
		$client->AddLevelBasedExp(10,1);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
