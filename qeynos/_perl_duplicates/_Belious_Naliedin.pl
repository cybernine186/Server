sub EVENT_SPAWN {
	#:: Create a proximity, 50 units across, 50 units tall, without proximity say
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25, $z - 25, $z + 25, 0);
}

sub EVENT_ENTER {
	#:: Match a 18717 - Tattered Note
	if (plugin::check_hasitem($client, 18717)) {
		$client->Message(15,"As you get your bearings, you hear a beautiful song. It almost seems to draw you towards it. It's as if you can hear a voice in your head as the music surrounds you. 'Welcome to the Wind Spirit's Song. I am Belious Naliedin. Read the note in your inventory and hand it to me when you are ready to begin your training as a bard.' The music then fades as quickly as it had begun.");
	}
}

sub EVENT_SAY {
	#:: Unable to find original dialogue--this is made up from EQ Lore
	if ($text=~/hail/i) {
		quest::say("Welcome, my name is Belious Naliedin of the League of Antonican Bards.  I used to work as one of the King's private entertainers, but now I pass my time-earned wisdom and skills on to others.  Do you have a note for me?");
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
#########:: Ykesha-era quest:  Custom Naliedin Lute
#	if ($text=~/hail/i) {
#		quest::say("Welcome, my name is Belious Naliedin of the League of Antonican Bards. A few years ago, I had finally saved up the money, and I bought this place. I settled in, and have been [working] here ever since.");
#	}
#	elsif ($text=~/working/i) {
#		quest::say("Ah, this is my shop. I am a musician, well known for my ability both in tuning, and [building instruments]");
#	}
#	elsif ($text=~/building instruments/i) {
#		quest::say("Young bards are often not the wealthiest people in Norrath, and oftentimes, they have nothing to accompany their beautiful voices when they sing. If young bards are able to locate, and bring to me the [various parts] to assemble a lute with, I provide the labor for free.");
#	}
#	elsif ($text=~/various parts/i) {
#		quest::say("If you are able to find an unfinished lute body, an unfinished lute neck, a box of lute strings, and a set of fine lute tuners I will be able to craft for you one of the best sounding lutes that you have ever heard in your young life, and it will be yours, free of charge. It has long been my desire to help out any young men and women who wish to explore the bardic arts.");
#	}
#########:: Bard Epic 1.0
#	elsif ($text=~/famous bard/i) {
#		quest::say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
#	}
#	elsif ($text=~/audience with him/i) {
#		quest::emote("laughs briefly.");
#		quest::say("Ah! In order to gain an audience with him, you must have a letter of introduction from me, otherwise he will not give you the time of day.");
#	}
#	elsif ($text=~/letter of introduction) {
#		quest::emote("looks around.");
#		quest::say("Well, you want a letter of introduction, eh? I think that fifty shiny platinum pieces sounds like a good introduction to me, my friend.");
#	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Sansa_Nusk.pl
	if ($signal == 1) {
		quest::say("I've seen some strange things in my travels and heard many unbelievable legends, but I've never heard of anything like that!");
	}
	#:: Match a signal "2" from qeynos/Joffrey_Clay.pl
	elsif ($signal == 2) {
		quest::say("Sure. Go Ahead and play it now, while the stage is clear.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18717 - Tattered Note
	if (plugin::takeItems(18717 => 1)) {
		quest::say("Good day friend, and welcome to the Wind Spirit's Song. Thank you for joining our cause. Go speak with Jusean Evanesque. I'm sure you'll fit in well. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		#:: Give a 13502 - Brown Tunic*
		quest::summonitem(13502);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 100);		#:: + League of Antonican Bards
		quest::faction(281, 15);		#:: + Knights of Truth
		quest::faction(262, 15);		#:: + Guards of Qeynos
		quest::faction(304, -5);		#:: - Ring of Scale
		quest::faction(285, -5);		#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(100);
	}
#########:: Ykesha-era quest:  Custom Naliedin Lute
#	#:: Match a 13775 - Unfinished Lute Body, 13776 - Unfinished Lute Neck, 13777 - Box of Lute Strings and 13778 - Fine Lute Tuners
#	elsif (plugin::takeItems(13775 => 1, 13776 => 1, 13777 => 1, 13778 =>1)) {
#		quest::say("Ok, great. See, assembling these isn't that hard. Add a few special touches, and there you go. Another beautiful Naliedin lute is born, and ears everywhere rejoice.");
#		#:: Ding!
#		quest::ding();
#		#:: Give a 13105 - Custom Naliedin Lute
#		quest::summonitem(13105);
#		#:: Set factions
#		quest::faction(284, 250);		#:: + League of Antonican Bards
#		quest::faction(281, 37);		#:: + Knights of Truth
#		quest::faction(262, 37);		#:: + Guards of Qeynos
#		quest::faction(304, -12);		#:: - Ring of Scale
#		quest::faction(285, -12);		#:: - Mayong Mistmoore
#		#:: Grant a moderate amount of experience
#		quest::exp(1000);
#	}
#########:: Bard Epic 1.0
#	#:: Match a 20374 - Ripped Qeynos Bards Guild Flyer
#	elsif (plugin::takeItems(20374 => 1)) {
#		quest::say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
#		#:: Ding!
#		quest::ding();
#		#:: Grant a small amount of experience
#		quest::exp(100);
#	}
#	#:: Match 50 plat
#	elsif (plugin::takeCoin(0, 0, 0, 50)) {
#		quest::say("Ah! Here is that letter of introduction I was looking for! Baenar likes to frequent a serene fountain in the southern Karanas. He finds the peace there accommodating to his work. He may even sing a tale for you if the mood strikes him.");
#		#:: Ding!
#		quest::ding();
#		#:: Give a 20373 - Letter of Introduction
#		quest::summonitem(20373);
#		#:: Grant a small amount of experience
#		quest::exp(100);
#	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
