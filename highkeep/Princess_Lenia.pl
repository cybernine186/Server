sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Come!! Let me flay your skin!!");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello kind sir. Please rescue me. I am a princess and can give you a generous reward. First talk with a high elf named Tearon. He should have something for me in order to escape.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13108 - Tearon's Bracer
	if (plugin::takeItems(13108 => 1)) {
		#:: Text made up
		quest::say("You fool! Carson will hear of this!");
		#:: ding
		quest::ding();
		#:: set factions
		quest::faction(329, 5);		#:: + Carson McCabe
		quest::faction(229, 5);		#:: + Coalition of Tradefolk
		quest::faction(332, 5);		#:: + Highpass Guards
		quest::faction(331, 5);		#:: + Merchants of Highpass
		quest::faction(304, -5);	#:: - Ring of Scale
		#:: Set race to 6 - Dark Elf
		$npc->SetRace(6);
		#:: Attack the player who triggered the event
		quest::attack($name);
	}
	#:: Match a 13112 - Tearon's Bracer
	elsif (plugin::takeItems(13112 => 1)) {
		#:: Text made up
		quest::say("You fool! Carson will hear of this!");
		#:: ding
		quest::ding();
		#:: set factions
		quest::faction(329, 5);		#:: + Carson McCabe
		quest::faction(229, 5);		#:: + Coalition of Tradefolk
		quest::faction(332, 5);		#:: + Highpass Guards
		quest::faction(331, 5);		#:: + Merchants of Highpass
		quest::faction(304, -5);	#:: - Ring of Scale
		#:: Set race to 6 - Dark Elf
		$npc->SetRace(6);
		#:: Attack the player who triggered the event
		quest::attack($name);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
