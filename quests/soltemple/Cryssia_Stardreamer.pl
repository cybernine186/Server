sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Well met $name. I am Cryssia Stardreamer of the Temple of Solusek Ro, protector of a powerful armor that will aid any bard in their journey across Norrath.  Are you a bard that desires this armor?");
	}
	elsif ($text=~/no/i) {
		quest::say("Very well then.");
	}
	elsif ($text=~/yes/i) {
		quest::say("Very well. I can craft a special type of bardic armor called lambent.  I can craft for you a set of [bracers], a [breastplate], a [helm], and [vambraces]. I require a special kind of lambent stone for each of my armor pieces.  Find my friends Orstorm, Genni, Gardern, and Vilissia within the temple and they will help you create them.");
	}
	elsif ($text=~/bracers/i) {
		quest::say("Alright, I will be needing some items. Return to me with them and I will craft your bracers. I will be needing a Dark Boned Bracelet, a Griffenne Charm, and a Lambent Fire Opal.");
	}
	elsif ($text=~/breastplate/i) {
		quest::say("This is the most difficult piece to make. In order for me to craft it I will be needing a Basalt Carapace, a Gypsy Lute, and a Lambent Ruby. Return to me with these and I will craft your breastplate.");
	}
	elsif ($text=~/helm/i) {
		quest::say("In order to craft the helm, I will be needing a Mudwater Rune, an Opoline Helm, and a Lambent Star Ruby. Give these items to me and I will craft your helm");
	}
	elsif ($text=~/vambraces/i) {
		quest::say("Very good, get me some Fiery Vambraces, the top portion of the Rune of the One Eye, and a Lambent Sapphire.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10564 - Dark Boned Bracelet, a 10563 - Griffenne Charm, and a 10128 - Lambent Fire Opal
	if (plugin::takeItems(10564 => 1, 10563 => 1, 10128 => 1)) {
		quest::say("Good show, $name, here is your lambent bracer");
		#:: Give a 4156 - Lambent Bracers
		quest::summonitem(4156);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 4100 - Basalt Carapace, a 10565 - Gypsy Lute, and a 10118 - Lambent Ruby
	elsif (plugin::takeItems(4100 => 1, 10565 => 1, 10118 => 1)) {
		quest::say("Exceptionally well done, $name, here is your lambent breastplate. Wear it with pride.");
		#:: Give a 4154 - Lambent Breastplate
		quest::summonitem(4154);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 10559 - Mudwater Rune, a 4099 - Opoline Helm, and a 10117 - Lambent Star Ruby
	elsif (plugin::takeItems(10559 => 1, 4099 => 1, 10117 => 1)) {
		quest::say("Well done, $name, here is your lambent helm. Wear it with the praises of the League of Antonican Bards.");
		#:: Give a 4153 - Lambent Helm
		quest::summonitem(4153);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 4113 - Fiery Vambraces, a 10560 - Rune of the One Eye, and a 10119 - Lambent Sapphire
	elsif (plugin::takeItems(4113 => 1, 10560 => 1, 10119 => 1)) {
		quest::say("Excellent, $name, you have proved yourself most resourceful. Here are your lambent vambraces.");
		#:: Give a 4155 - Lambent Vambraces
		quest::summonitem(4155);
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
