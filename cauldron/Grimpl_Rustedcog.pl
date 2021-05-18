sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Can I help you, or do you normally walk up to those you don't know and stare at them?");
	}
	elsif ($text=~/jagged fang/i) {
		quest::say("Jagged Fang is a long time resident of this here lake. Her scales secrete a liquid that is quite potent. The effects of this liquid causes one's mind and body to become weak. While she is a rather non-aggressive beast, I would suggest you bring some friends if you plan on getting some of her venom. Oh and one more thing, if you can manage to subdue her bring me back what you get and then I will tell ya who can help out with the other item you need.");
		#:: Spawn Dagnor's Cauldron >> Jagged_Fang (70071)
		quest::spawn2(70071, 0, 0, -1416, -1486, 52, 13);
	}
}

sub EVENT_ITEM {
	#:: Match a 67003 - Note to Grimpl
	if (plugin::takeItems(67003 => 1)) {
		quest::say("Ah, you want some Viscous Venom, eh? Well I just used my last little bit to settle a score with an old gambling buddy. If you really want some you'll have to get it from good Ol' [Jagged Fang]!");
	}
	#:: Match a 67005 - Venom Filled Scales
	elsif (plugin::takeItems(67005 => 1)) {
		quest::say("Heh, I thought I would never see you again. Guess Ol' Jagged Fang wasn't as tough as I heard. Anyway here are your scales back and a note to my friend Saeko. She should be able to help you. You can normally find her wandering around the Southern Desert.");
		#:: Give a 67005 - Note to Grimpl
		quest::summonitem(67005);
		#:: Give a 67004 - Note to Saeko
		quest::summonitem(67004);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
