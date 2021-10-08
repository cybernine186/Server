sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Well met $name. I am Vira, elementalist of Solusek Ro. I guard the secrets of the tools of [elemental summoning]. If you are a magician, you might be interested.");
	}
	elsif ($text=~/elemental summoning/i) {
		quest::say("I hold the secrets to the construction of four tools which assist magicians with the summoning of elementals. I know about the [broom of Trilon], the [shovel of Ponz], the [torch of Alna] and the [stein of Ulissa].");
	}
	elsif ($text=~/broom of trilon/i) {
		quest::say("The broom of Trilon was held by the infamous Mistress of Air of the same name. Are you [interested in the broom]?");
	}
	elsif ($text=~/interested in the broom/i) {
		quest::say("I will construct a replica of the broom of Trilon for you, but I will need the following components to make it: a star ruby; a feather from a griffon, a broom from a magician in Najena and the toes of a cyclops. Bring me these four components, and I will fashion for you an object of elemental power.");
	}
	elsif ($text=~/shovel of ponz/i) {
		quest::say("The shovel of Ponz was crafted by the earthen master of the same name. Are you [interested in the shovel]?");
	}
	elsif ($text=~/interested in the shovel/i) {
		quest::say("I will create a replica of the shovel of Ponz for you, but I will need the following components to make it: a ruby, the eyes of a gargoyle, a shovel from a magician in Najena and the toes of a hill giant. Bring me these four components, and I will construct for you an object of elemental power.");
	}
	elsif ($text=~/stein of ulissa/i) {
		quest::say("The stein of Ulissa was found and used by the mistress of water of the same name. Are you [interested in the stein]?");
	}
	elsif ($text=~/interested in the stein/i) {
		quest::say("I will devise a replica of the stein of Ulissa for you, but I will need the following items to make it: a sapphire, a scale from a mermaid, a stein from a magician in Najena and the toes of an ice giant. Bring me these four components, and I will make for you an object of elemental power.");
	}
	elsif ($text=~/torch of alna/i) {
		quest::say("The torch of Alna was constructed and held by the fire mistress of the same name. Are you [interested in the torch]?");
	}
	elsif ($text=~/interested in the torch/i) {
		quest::say("I will make a replica of the torch of Alna for you, but I will need the following items to make it: a fire emerald, a scale from a fire drake, a torch from a magician in Najena and the toes of a fire giant. Bring me these four components, and I will build for you an object of elemental power.");
	}
}

sub EVENT_ITEM {
	#:: Match a 16544 - Broom, a 16543 - Cyclops Toes, a 16538 - Griffon Feathers, and a 10032 - Star Ruby
	if (plugin::takeItems(16544 => 1, 16543 => 1, 16538 => 1, 10032 => 1)) {
		quest::say("All of the components to make the infamous broom of Trilon! Well done, adventurer. As you have proven yourself worthy, I grant you this broom.");
		#:: Give a 6360 - Broom of Trilon
		quest::summonitem(6360);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 10035 - Ruby, a 10014 - Gargoyle Eye, a 16545 - Shovel, and a 16539 - Hill Giant Toes
	elsif (plugin::takeItems(10035 => 1, 10014 => 1, 16545 => 1, 16539 => 1)) {
		quest::say("Each of the four items needed to construct the famed Shovel of Ponz! Very well. As you have displayed ingenuity, I grant you this shovel.");
		#:: Give a 6361 - Shovel of Ponz
		quest::summonitem(6361);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 16540 - Ice Giant Toes, a 16542 - Mermaid Scale, a 10034 - Sapphire, and a 16547 - Stein
	elsif (plugin::takeItems(16540 => 1, 16542 => 1, 10034 => 1, 16547 => 1)) {
		quest::say("The four components required for the stein of Ulissa?! I am impressed! As you have displayed valor, I grant you this stein.");
		#:: Give a 6363 - Stein of Ulissa
		quest::summonitem(6363);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 16546 - Torch, a 16534 - Fire Drake Scale, a 10033 - Fire Emerald, and a 16541 - Fire Giant Toes
	elsif (plugin::takeItems(16546 => 1, 16534 => 1, 10033 => 1, 16541 => 1)) {
		quest::say("All of the pieces of the famous Torch of Alna! I never thought you would find them all! As you have displayed courage, I grant you this torch.");
		#:: Give a 6362 - Torch of Alna
		quest::summonitem(6362);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 5);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
#:::::::::: LOY-Era quest
#::	#:: Match a 58003 - Vial of Liquid
#:: 	elsif (plugin::takeItems(58003 => 1)) {
#::		quest::emote("swallows the liquid in the vial. After a few minutes, you notice the fire in the small gnome subside. She looks up at you and says, 'Why thank you. My twin was correct in her assumption of the power of the elements of Broken Skull. It's curious that she remained behind. Here, take this note to her so she can be assured that I am on the road to recovery.'");
#::		#:: Give a 58004 - Note to Vera
#::		quest::summonitem(58004);
#::	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
