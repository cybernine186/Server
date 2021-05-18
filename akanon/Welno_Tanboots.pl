sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_ENTER {
	#:: Check for 18776 - Recruitment Summons
	if (plugin::check_hasitem($client, 18776)) { 
		$client->Message(15,"A voice echoes throughout the room as you take in your surroundings. 'Hey you! This is Welno Tanlonikan. Remember me? Read the note in your inventory and then hand it to me. Hurry up! We don't have all day! You owe me a lot of money!'");
	}
}

sub EVENT_SAY {
	if ($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: GIve a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
	}
	elsif ($text=~/second book/i){ 
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: GIve a 51122 - Tradeskill Basics : Volume I
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	#:: Match a 18776 - Recruitment Summons
	if (plugin::takeItems(18776 => 1)) {
		quest::say("Yes, I just knew you'd see it my way, $name. Anyway, welcome to our little part of Ak'Anon's underworld. We have to pay a high price to keep our small orgainzation hidden, which keeps us all busy around here. Now throw this on, and let's put you to work. Once you are ready to begin your training please make sure that you come back to see me after collecting your initial supplies! I have many things to teach you that you would benefit from, from furthering your knowledge of our arts, to the various [trades] you will have available to you.");
		#:: Give a 13519 - Scuffed Tunic*
		quest::summonitem(13519); 
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(240, 100); 		#:: + Deep Muses
		quest::faction(288, 15); 		#:: + Merchants of Ak'Anon
		quest::faction(238, -15); 		#:: - Dark Reflection
		quest::faction(255, 15); 		#:: + Gem Choppers
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
