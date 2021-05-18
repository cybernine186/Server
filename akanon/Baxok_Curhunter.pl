sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_ENTER {
	#:: Check for 18770 - Recruitment Summons
	if (plugin::check_hasitem($client, 18770)) { 
		$client->Message(15,"Baxok Curhunter, a jittery older looking gnome appears to be startled. 'Well hello there. You scared me! You young ones always popping up here and there. You would think there is a hidden tunnel somewhere around here the way you just popped up near me. Well no matter. If you are here to train with the warriors of Gemchopper Hall, read the note in your inventory and hand it to me to begin your training.'");
	}
}  

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::emote("Hail, $name. I invite you to serve the mighty state of Ak'Anon by becoming a Gemchopper. We gnomes are not known for our warrior skills, but those few who endure and survive to become elite amongst our warriors soon find that the technology of the gnomes has found its way into our halls. You must be a [new recruit] or [an outsider], perhaps?");
	}
	elsif ($text=~/new recruit/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Well, good to make your acquaintance, $name. Maybe someday you shall be a great Watchman. Until then, I have a task for you. Will you [serve the Crown] or has a yellow streak fallen upon your back?");
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for Rogue Clockworks. Captain Compolten shall accept Two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	}
	elsif ($text=~/an outsider/i) {
		quest::say("I should have guessed as much. You look the part.");
	}
	elsif ($text=~/serve the Crown/i) {
		#:: Match level five and under
		if ($ulevel <= 5) {
			quest::say("You are too inexperienced. Leave that business to someone more worldly."); 
		}
		#:: Match over level five
		else {
			quest::say("Go to the Lesser Faydarks. There you will seek out a Fairy city. It seems as though the little pests have stolen one of our fabulous Clockworks. Destroy the Clockwork and bring me proof. Be very careful. The Fairy folk may be small, but they pack a punch.");
		}	
	}
	elsif ($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: Give a 51121 - Tradeskill Basics: Volume 1
		quest::summonitem(51121);
	}
	elsif ($text=~/second book/i) {
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: Give a 51122 - Tradeskill Basics: Volume II
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	#:: Match a 18770 -  Recruitment Summons
	if (plugin::takeItems(18770 => 1)) {
		quest::say("I, Baxok, guildmaster, welcome you to Gemchopper Hall, young warrior! You are expected to serve his majesty, King Ak'Anon, with pride. You have much to learn. You may report to Naygog for further guidance. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		#:: Give item 13520 - Torn and Ripped Tunic*
		quest::summonitem(13520);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(255, 100); 	#:: + Gem Cutters
		quest::faction(288, 25); 	#:: + Merchants of Ak'Anon
		quest::faction(333, 25); 	#:: + King Ak'Anon
		quest::faction(238, -25); 	#:: - Dark Reflection
		quest::faction(1604, -5); 	#:: - Clan Grikbar
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Match a 13344 - Blackbox XIVD
	elsif (plugin::takeItems(13344 => 1)) {
		#:: Give a random reward: choose some cloth armor or round shield
		quest::summonitem(quest::ChooseRandom(9002,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1010,1011));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 10); 	#:: + Gem Cutters
		quest::faction(288, 10); 	#:: + Merchants of Ak'Anon
		quest::faction(333, 10); 	#:: + King Ak'Anon
		quest::faction(238, -10); 	#:: - Dark Reflection
		quest::faction(1604, -10); 	#:: - Clan Grikbar
		#:: Grant a large amount of experience
		quest::exp(25000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
