sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_ENTER {
	#:: Match a 18759 - Stained Parchment
	if (plugin::check_hasitem($client, 18759)) { 
		$client->Message(15,"A diminutive, but powerful looking gnome stands before you. 'I am Naygog Mitope. The Dark Reflection has called you. Read the note in your inventory and hand it to me when you wish to begin your training. Your destiny awaits!'");
	}
}

sub EVENT_SAY {
	if ($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: Give a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
	}
	elsif ($text=~/second book/i) { 
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: Give a 51122 - Tradeskill Basics : Volume II
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	# Match a 18759 - Stained Parchment
	if (plugin::takeItems(18759 => 1)) { 
		quest::say("This is fabulous news!! You have done well, young one. When you have become more experienced in our art, I will be able to further train you, both in our art as well as in some of the various [trades] you will have available to you.");
		#:: Give a 13518 - Tin Patched Tunic*
		quest::summonitem(13518);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(240, -10); 		#:: - Deepmuses
		quest::faction(245, -10); 		#:: + Eldritch Collective
		quest::faction(238, 100); 		#:: + Dark Reflection
		quest::faction(255, -10); 		#:: -  Gem Choppers
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
