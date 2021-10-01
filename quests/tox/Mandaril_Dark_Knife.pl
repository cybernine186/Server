sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_ENTER {
	#:: Match 18017 - Fell Blade Guild Note
	if (plugin::check_hasitem($client, 18017)) {
		$client->Message(15, "Mandaril Dark Knife glances at you with obvious scorn. 'Are you here to seek the ways of the Dark Truth? If that is the case, then read the note in your inventory and then hand it to me. If you are not here for such a purpose, I suggest you leave at once lest you anger me further.'");
	}
}

sub EVENT_SAY { 
	if($text=~/hail/i) {
		quest::say("Desist in your prattle.  If you want idle chitchat, talk to someone else."); 
	}
	elsif($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: Give a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
	}
	elsif($text=~/second book/i) {
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: Give a 51122 - Tradeskill Basics : Volume II
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	#:: Match 18017 - Fell Blade Guild Note
	if (plugin::takeItems(18017 => 1)) {
		quest::say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth. Once you are ready to begin your training please make sure that you see Faratain, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		#:: Give a 13573 - Blood-Spattered Tunic
		quest::summonitem(13573);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(265, 100);	# + Heretics
		quest::faction(242, -100);	# - Deepwater Knights
		quest::faction(254, -100);	# - Gate Callers
		quest::faction(231, -100);	# - Craftkeepers
		quest::faction(233, -100);	# - Crimson Hands
		#:: Grant a small amount of experience
		quest::exp(100);
	} 
	#:: Return unused items
	plugin::returnUnusedItems();
}
