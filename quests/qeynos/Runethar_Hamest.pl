sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_ENTER {
	#:: Match a 18710 - Tattered Note
	if (plugin::check_hasitem($client, 18710)) {
		$client->Message(15,"As you glance about the large temple, Runethar Hamest greets you. 'Why hello there. Are you perhaps a new recruit? If you wish to follow the ways of Karana and become a paladin, read the note in your inventory and hand me your note to start your training.'");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Wolten_Grafe.pl
	if ($signal == 1) {
		quest::say("Hire one soon, Wolten. We need to get in touch with Drosco!");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you [need guidance] or are you [already a follower of Karana]?");
	}
	elsif ($text=~/need guidance/i) {
		quest::say("Then go forth into the church and speak with Gehna Solbenya. She will assist you.");
	}
	elsif ($text=~/follower of karana/i) {
		quest::say("So you are one with our cause? This is good. Be aware that there are forces at work which not even the Qeynos Guard can keep at bay. We are here to spread the words of Karana and smite those who should try to end His children. We and Antonius Bayle shall work together in our destruction of evil. He requests our aid. Do you also [wish to assist Lord Bayle]?"); 
	}
	elsif ($text=~/wish to assist/i) {
		quest::say("Then we command you to assist the Qeynos Guard with the destruction of Blackburrow. Report to Captain Tillin of Qeynos Guard and speak with him of the [gnolls of Blackburrow]. I believe he is at the arena. My loyal friend, if you have earned your Thunder Staff, I urge you to [retrieve the Bayle list].");
	}
	elsif ($text=~/retrieve/i) {
		#:: Match if faction is Warmly or better
		if ($faction < 3) {
			quest::say("The Temple of Thunder was asked by Antonius Bayle to retrieve a list. He does not trust his own militia of late. He asked me to send a knight to the Jaggedpine to find a man named Frenway Marthank. When you find him, you are to tell him that [Toe needs the Bayle List]. Return the Bayle List and your Thunder Staff to me and I shall provide a fine reward. Be aware that the shadowknights of Bertoxxulous are also after the list. Be careful!");
		}
		#:: Match if faction is Kindly or worse
		elsif ($faction > 2) {
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause");
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
	#:: Match a 18710 - Tattered Note
	if (plugin::takeItems(18710 => 1)) {
		quest::say("Greetings, fellow knight of Karana, and welcome to the Temple of Thunder! Here, wear this tunic and help our crusade. Wolten Grafe is my assistant, he will get you started and teach you the ways of the Rainkeeper. Once you are ready to begin your hunting training please see Vansted Rohenga, he will assist you in some tasks for your early adventures. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available for you.");
		#:: Give a 13505 - Old Gray Tunic*
		quest::summonitem(13505);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, 100);	#:: + Knights of Thunder
		quest::faction(221, -100);	#:: - Bloodsabers
		quest::faction(341, 75);	#:: + Priests of Life
		quest::faction(262, 75);	#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Match a 6357 - Thunder Staff and a 18809 - Bayle List II
	elsif (plugin::takeItems(6357 => 1, 18809 => 1)) {
		quest::say("Antonius Bayle will be pleased. The Temple is also pleased. Here is the enchanted staff we call Bonethunder. Should you find the enchantment gone, just ask Kasine to [enchant Bonethunder]. We need more disciples like you! Go forth to tell the world of the Rainkeeper."); 
		#:: Give a 6358 - Bonethunder Staff
		quest::summonitem(6358);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, -50);	#:: - Knights of Thunder
		quest::faction(221, 50);	#:: + Bloodsabers
		quest::faction(341, -37);	#:: - Priests of Life
		quest::faction(262, -37);	#:: - Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
