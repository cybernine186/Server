sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I am Gardern, listed among the chosen of Solusek Ro.  I hold the lore to the [Staff of Temperate Flux] and the [Weeping Wand] - items coveted by my Wizardly brethren.");
	}
	elsif ($text=~/staff of temperate flux/i) {
		quest::say("The Staff of Temperate Flux is a boon to those who dabble in the elemental arts, for it can increase the susceptibility of a creature to both fire and cold.  Are you [interested in the staff]?");
	}
	elsif($text=~/interested in the staff/i) {
		quest::say("I will craft you a Staff of Temperate Flux, but you must bring me the components which I require to make it.  I will need a Heart of Fire from an Inferno Goblin Wizard in the Caverns of Solusek, a Heart of Frost from a Goblin Wizard in the Caverns of Permafrost, a Rod of Bone from a Stone Skeleton by the shores of Lake Rathe and a Staff of Ro.  Bring me these items, and I will make you your staff.");
	}
	elsif ($text=~/weeping wand/i) {
		quest::say("The Weeping Wand is a fine item for a Wizard - it can aid as a focus for concentration, and, if needed, be used to parry as well.  Are you [interested in the wand]?");
	}
	elsif ($text=~/interested in the wand/i) {
		quest::say("I can make you a Weeping Wand, but you will need to bring me certain components.  I will need a Silver Wand from a Silvered Guard in the Temple Cazic Thule, A Bloodblack Wand from the Mountains of Rathe, Twice-Woven Silk from a Faerie Guard in Faydark and a Scepter of Sorrow from the Tomb in Castle Mistmoore.  Bring me these items and I will make for you a Weeping Wand.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10548 - Heart of Fire, 10549 - Heart of Frost, a 10550 - Rod of Bone, and a 6048 - Darkwood Staff
	if (plugin::takeItems(10548 => 1, 10549 => 1, 10550 => 1, 6048 => 1)) {
		quest::say("Well done, $name - here is the staff of Temperate Flux. Use it with the blessings of the Temple of Solusek Ro.");
		#:: Give a 6342 - Staff of Temperate Flux
		quest::summonitem(6342);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 10551 - Bloodblack Wand, a 6338 - Silver Wand, a 10557 - Twice-Woven Silk, and a 14364 - Scepter
	elsif (plugin::takeItems(10551 => 1, 6338 => 1, 10557 => 1, 14364 => 1)) {
		#:: Need correct dialogue
		quest::say("Well done, $name. Now I will craft your Weeping Wand, as promised.");
		#:: Give a 6341 - Weeping Wand
		quest::summonitem(6341);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 10000 - Lambent Stone, and two 10034 - Sapphire 
	elsif (plugin::takeItems(10000 => 1, 10034 => 1)) {
		quest::say("Here is your prize - a lambent sapphire.");
		#:: Give a 10119 - Lambent Sapphire
		quest::summonitem(10119);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
