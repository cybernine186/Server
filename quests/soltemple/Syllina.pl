sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Hello, I am Syllina, follower of Solusek Ro and keeper of the [Shadow Lore].");
	}
	elsif ($text=~/shadow lore/i) {
		quest::say("I hold the secrets to the Shadow Lore so highly prized by Necromancers. If you are interested, I can tell you about [ShadowBound Boots], [ShadowBound Gloves], the [Robe of Enshroudment] or the secrets to the making of [Shadow Silk].");
	}
	elsif ($text=~/shadowbound boots/i) {
		quest::say("ShadowBound Boots are boots woven from purest shadow. If you are interested, I will weave you a pair - but I will need [boot components].");
	}
	elsif ($text=~/boot components/i) {
		quest::say("I will need the following items to make you a pair of ShadowBound Boots: Shadow Silk, The Scepter of Sorrow from Castle Mistmoore, an Eye of Shadow from our mortal enemies the Shadowed Men and a Skeletal toe from a Rathe Giant Skeleton.");
	}
	elsif ($text=~/shadowbound gloves/i) {
		quest::say("ShadowBound Gloves are gloves woven from the purest shadow. If you are interested, I will weave you a pair - but I will need [glove components].");
	}
	elsif ($text=~/glove components/i) {
		quest::say("I will need the following items to make you a pair of ShadowBound Gloves: Inky Shadow Silk, The Scepter of Tears from the circle-stair-waterfall of Guk, a Hand of Shadow from our mortal enemies the Shadowed Men and a Skeletal finger from a Rathe Giant Skeleton.");
	}
	elsif ($text=~/robe of enshroudment/i) {
		quest::say("The Robe of Enshroudment is a robe woven from the purest of shadow. If you are interested, I will weave you a robe - but I will need the following [robe components].");
	}
	elsif ($text=~/robe components/i) {
		quest::say("I will need the following items to make you a Robe of Enshroudment: Large Shadow Silk, A Werebat Wing from the Estate of Unrest, A Mask of Shadow from our mortal enemies the Shadowed Men and a Globe of Shadow from a Nokta Shaman in Guk.");
	}
	elsif ($text=~/shadow silk/i) {
		quest::say("If you are interested, I will tell you the secrets of making Shadow Silk for a mere 50 pieces of gold.");
	}
}

sub EVENT_ITEM {
	#:: Match 50 gold pieces
	if (plugin::takeCoin(0, 0, 50, 0)) {
		quest::say("You will need to give the following components to a tailor: a Shadow Wolf Pelt, a Silk Swatch and a Scroll of Gather Shadows. Have the tailor weave them together and she will make you Shadow Silk. To make large shadow silk add an extra shadow wolf pelt. To make inky shadow silk, add an extra scroll.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
	}
	#:: Match a 16484 - Large Shadow Silk, 13239 - Werebat Wing, 2309 - Mask of Shadow, 10535 - Globe of Shadow
	elsif (plugin::takeItems(16484 => 1, 13239 => 1, 2309 => 1, 10535 => 1)) {
		quest::say("Silk, wing, mask, globe... all of the components necessary for the making of a robe of Enshroudment. Well done. Here is your reward.");
		#:: Give a 1355 - Robe of Enshroudment
		quest::summonitem(1355);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 14363 - Scepter, 13234 - Hand of Shadow, 10534 - Skeletal Finger, and 16845 - Lead Sulphide
	elsif (plugin::takeItems(14363 => 1, 13234 => 1, 10534 => 1, 16845 => 1)) {
		quest::say("So you have gathered all of the components for me to weave Shadowbound Gloves... Well done. You will be wanting these.");
		#:: Give a 3318 - ShadowBound Gloves
		quest::summonitem(3318);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 14364 - Scepter, a 13180 - Eye of Shadow, a 10533 - Skeletal Toe, and a 16483 - Shadow Silk
	elsif (plugin::takeItems(14364 => 1, 13180 => 1, 10533 => 1, 16483 => 1)) {
		quest::say("'I see that you have gathered all of the necessary components... Well done. Here are your Shadowbound Boots.");
		#:: Give a 3317 - ShadowBound Boots
		quest::summonitem(3317);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
