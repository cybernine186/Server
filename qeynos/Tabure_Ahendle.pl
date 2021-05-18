sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_ENTER {
	#:: Match a 18707 - Recruitment Flyer
	if (plugin::check_hasitem($client, 18707)) {
		$client->Message(15,"A deep voice breaks the silence as you attempt to get your bearings. 'Come young recruit, I sense your apprehension. You will never make an adequate warrior with fear clouding your mind. I am Tabure Ahendle, Guild Master for the Steel Warriors. Read the note in your inventory and then hand it to me to begin your training.'");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("What have we here?  Perhaps a future Ebon Strongbear?  A [member of the Steel Warriors]?  If the way of the warrior is not to your liking, might I suggest joining the League of Antonican Bards?  The only damage you might take there is a sore throat! HAHAHA!");
	}
	elsif ($text=~/steel warriors/i) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		}
		else {
			quest::say("A warrior, you say? I have never met you. You must be from the [bunker] or perhaps just a new recruit. You should test your skills with Brin Stolunger. When you have done that, then, maybe you could [assist] me.");
		}
	}
	elsif ($text=~/bunker/i) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		}	
		else {
			quest::say("Far to the eastern coast of Antonica lies the great trade city of Freeport. It is there that our second chapter of Steel Warriors has built the arena called the bunker.");
		}
	}
	elsif ($text=~/assist/i) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		}	
		else {
			quest::say("So, you think you can be of assistance to me? Let me test your skill. Travel to Erudin and seek out the beasts which are called Kobolds. I have never seen one and would very much like to have four Kobold Hides with which to make a rug. To do so would earn you some barely used rawhide armor - maybe even a shield.");
		}
	}
	elsif ($text=~/dangrous task/i) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		}	
		else {
			quest::say("A ship sank while returning from Odus. On this ship was my squire, Tombor. He sank to the bottom and there he still lies. With him went a map. I would very much like you to search for this sunken ship. Return the map to me. I am sure it is still in the rotting hands of Tombor.");
		}
	}
	elsif ($text=~/trades/i) {
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
	#:: Match a 18707 - Recruitment Flyer
	if (plugin::takeItems(18707 => 1)) {
		quest::say("Welcome to the Hall of Steel, our swords are strong, and our warriors stronger. Here is our guild tunic. Brin Stolunger is in charge of our new recruits. Go see him, and he'll teach the basics. You look like you'll make a fine addition to our guild. Once you are ready to pave your path to glory return to me for some initial armor quests. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		#:: Give a 13572 - Dirty Training Tunic*
		quest::summonitem(13572);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(311, 100);			#:: + Steel Warriors
		quest::faction(262, 20);			#:: + Guards of Qeynos
		quest::faction(230, -15);			#:: - Corrupt Qeynos Guards
		quest::faction(330, -15);			#:: - The Freeport Militia
		quest::faction(281, 20);			#:: + Knights of Truth
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Match four 13424 - Kobold Hide
	elsif (plugin::takeItems(13424 => 4)) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
			#:: Return four 13424 - Kobold Hide
			quest::summonitem(13424);
			quest::summonitem(13424);
			quest::summonitem(13424);
			quest::summonitem(13424);
		}	
		else {
			quest::say("Incredible!! Such grand tones. It shall make a fine rug. You have shown me that you cannot always judge a book by its cover. You are quite skilled. Would you like to perform a [dangrous task] for me?");
			#:: Give a random reward: 2147 - Raw-hide Leggings, 2140 - Raw-hide Tunic, 9002 - Round Shield
			quest::summonitem(quest::ChooseRandom(2147, 2140, 2147, 2140, 9002));
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(311, 20);		#:: + Steel Warriors
			quest::faction(262, 4);			#:: + Guards of Qeynos
			quest::faction(230, -3);		#:: - Corrupt Qeynos Guards
			quest::faction(330, -3);		#:: - The Freeport Militia
			quest::faction(281, 4);			#:: + Knights of Truth
			#:: Grant a small amount of experience
			quest::exp(500);
			#:: Create a hash for storing cash - 100 to 200 cp
			my %cash = plugin::RandomCash(100,200);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
	}
	#:: Match a 13423 - Blurred Map
	elsif (plugin::takeItems(13423 => 1)) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
			#:: Return a 13424 - Blurred Map
			quest::summonitem(13424);
		}	
		else {
			quest::say("The map!! It is all blurred. The ink has run. I shall never be able to decipher it now. Still, I owe you for completion of your mission. May these be of assistance. It is always good for a warrior to be well supplied.");
			#:: Give a 5082 - Cast-Iron Long Sword
			quest::summonitem(5082);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(311, 20);		#:: + Steel Warriors
			quest::faction(262, 4);			#:: + Guards of Qeynos
			quest::faction(230, -3);		#:: - Corrupt Qeynos Guards
			quest::faction(330, -3);		#:: - The Freeport Militia
			quest::faction(281, 4);			#:: + Knights of Truth
			#:: Grant a small amount of experience
			quest::exp(500);
			#:: Create a hash for storing cash - 100 to 200 cp
			my %cash = plugin::RandomCash(100,200);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
