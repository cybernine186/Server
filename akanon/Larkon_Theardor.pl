sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings! Welcome to the Library of Mechanimagica. You must be a [current member of the Library] or has my [mind begun to slip]?");
	}
	elsif ($text=~/mind begun to slip/i) {
		quest::say("What!!? That was but a joke. I try to make you feel comfortable with a little levity and you proclaim my mind has gone the way of Meldrath's. Well.. enough frivolity. You will do your part to help in the menial tasks of the Collective. Do you want the [clean tasks] or the [dirty tasks]?");
	}
	elsif ($text=~/clean tasks/i) {
		quest::say("Clean.. Dirty.. It matters not. You have upset me with your rude remarks. You will go to the Steamfont Mountains. There you will find Fodin and tell him I have sent you. He will have a nice tidy task for you. A bath!! Be on your way!?");
	}
	elsif ($text=~/dirty tasks/i) {
		quest::say("Clean.. Dirty.. It matters not. You have upset me with your rude remarks. You will go to the Steamfont Mountains. There you will find Fodin and tell him I have sent you. He will have a nice tidy task for you. A bath!! Be on your way!?");
	}
	elsif ($text=~/current member of the Library/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Good. The last thing a member of the Eldritch Collective needs is to lose his mind. Look what happened to Meldrath. Enough chitchat. I am Larkon and it is not my job to teach you. It is my job to direct you to service. We require items and such to complete our studies. We need someone of moderate skill to [gather minotaur horns] and [collect basilisk tongues]?");
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you. Perhaps fetching Minotaur Horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
		}
		else {
			quest::say("You dare to speak to a member of the Eldritch Collective!! You had best leave before you find your soul displaced from your body.");
		}
	}
	elsif ($text=~/gather minotaur horns/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("We magicians require the horns of minotaurs. We crush them down and use the powder in many of our tests. Go and fetch two minotaur horns. Do not return empty-handed. I await your return as does your reward.");
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.");
		}
		else {
			quest::say("You dare to speak to a member of the Eldritch Collective!! You had best leave before you find your soul displaced from your body.");
		}
	}
	elsif ($text=~/collect basilisk tongues/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Very good of you. Go beyond the land of the gnomes and seek out basilisks. Return four of their tongues to me and I shall share the knowledge of the magicians of the Eldritch Collective.");
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.");
		}
		else {
			quest::say("You dare to speak to a member of the Eldritch Collective!! You had best leave before you find your soul displaced from your body.");
		}
	}
	elsif ($text=~/kaladim/i) {
		quest::say("We need someone to venture to the dwarven kingdom of Kaladim and speak with Myre of Miner's Guild 628. She has a delivery of special pestles made from bozinite. If you feel up to it, go to her and tell her you are from the Eldritch Collective and desire the bozinite pestles. Return them to me.");
	}
}

sub EVENT_ITEM {
	#:: Match two 13077 -  Minotaur Horn
	if (plugin::takeItems(13077 => 2)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Fine work. You have earned the respect of the Library. Here is a small token of our appreciation. We shall have this ground down as soon as we find someone to go to [Kaladim].");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(245, 10); 	#:: + Eldritch Collective
			quest::faction(255, 10); 	#:: + Gem Choppers
			quest::faction(333, 10); 	#:: + King Ak'Anon
			quest::faction(238, -30); 	#:: - Dark Reflection
			quest::faction(239, -30); 	#:: - The Dead
			#:: Grant a small amount of experience
			quest::exp(100);
			#:: Create a hash for storing cash - 200 to 250cp
			my %cash = plugin::RandomCash(200,250);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			#:: Made up
			quest::say("There is much more you must do for the Library of Mechanimagica before we can accept such things from you.");
			#:: Return two 13077 -  Minotaur Horn
			quest::summonitem(13077);
			quest::summonitem(13077);
		}
	}
	#:: Match one 13077 -  Minotaur Horn
	elsif (plugin::takeItems(13077 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("'I will require Two Minotaur Horns for further studies.");
			#:: Return one 13077 -  Minotaur Horn
			quest::summonitem(13077);
		}
		else {
			#:: Made up
			quest::say("There is much more you must do for the Library of Mechanimagica before we can accept such things from you.");
			#:: Return one 13077 -  Minotaur Horn
			quest::summonitem(13077);
		}
	}	
	#:: Match a 13071 -  Air Tight Box
	elsif (plugin::takeItems(13271 => 1)) {
		quest::say("Ah! See? you weren't too afraid to get your hands dirty after all. Now go take a bath!");
		#:: Give item 10017 - Turquoise
		quest::summonitem(10017);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(245, 10); 	#:: + Eldritch Collective
		quest::faction(255, 10); 	#:: + Gem Choppers
		quest::faction(333, 10); 	#:: + King Ak'Anon
		quest::faction(238, -30); 	#:: - Dark Reflection
		quest::faction(239, -30); 	#:: - The Dead
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 200 to 250cp
		my %cash = plugin::RandomCash(200,250);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match four 12160 -  Basilisk Tongue
	elsif (plugin::takeItems(12160 => 4)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("What took you so long?!! These tongues are nearly dried out!! Here. A scroll from the Magicians Hold. Learn it and serve!!");
			#:: Randomly choose various mage level spells excluding pet item spells
			quest::summonitem(quest::ChooseRandom(15205,15211,15288,15310,15311,15313,15331,15050,15093,15315,15316,15058,15317,15318,15036,15094,15246,15322,15323,15325,15851,15324,15332,15400,15399,15398,15042,15613));
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(245, 10); 	#:: + Eldritch Collective
			quest::faction(255, 10); 	#:: + Gem Choppers
			quest::faction(333, 10); 	#:: + King Ak'Anon
			quest::faction(238, -30); 	#:: - Dark Reflection
			quest::faction(239, -30); 	#:: - The Dead
			#:: Grant a small amount of experience
			quest::exp(100);
			#:: Create a hash for storing cash - 1500 to 1600cp
			my %cash = plugin::RandomCash(1500,1600);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			#:: Made up
			quest::say("There is much more you must do for the Library of Mechanimagica before we can accept such things from you.");
			#:: Return four 12160 -  Basilisk Tongue
			quest::summonitem(12160);
			quest::summonitem(12160);
			quest::summonitem(12160);
			quest::summonitem(12160);
		}
	}
	#:: Match three 12160 -  Basilisk Tongue
	elsif (plugin::takeItems(12160 => 3)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I believe I called for FOUR Basilisk Tongues.");
			#:: Return three 12160 -  Basilisk Tongue
			quest::summonitem(12160);
			quest::summonitem(12160);
			quest::summonitem(12160);
		}
		else {
			#:: Made up
			quest::say("There is much more you must do for the Library of Mechanimagica before we can accept such things from you.");
			#:: Return three 12160 -  Basilisk Tongue
			quest::summonitem(12160);
			quest::summonitem(12160);
			quest::summonitem(12160);
		}
	}
	#:: Match two 12160 -  Basilisk Tongue
	elsif (plugin::takeItems(12160 => 2)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I believe I called for FOUR Basilisk Tongues.");
			#:: Return two 12160 -  Basilisk Tongue
			quest::summonitem(12160);
			quest::summonitem(12160);
		}
		else {
			#:: Made up
			quest::say("There is much more you must do for the Library of Mechanimagica before we can accept such things from you.");
			#:: Return two 12160 -  Basilisk Tongue
			quest::summonitem(12160);
			quest::summonitem(12160);
		}
	}
	#:: Match one 12160 -  Basilisk Tongue
	elsif (plugin::takeItems(12160 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I believe I called for FOUR Basilisk Tongues.");
			#:: Return two 12160 -  Basilisk Tongue
			quest::summonitem(12160);
		}
		else {
			#:: Made up
			quest::say("There is much more you must do for the Library of Mechanimagica before we can accept such things from you.");
			#:: Return one 12160 -  Basilisk Tongue
			quest::summonitem(12160);
		}
	}
	#:: Turn in for 12160 -  Bozinite Pestle
	elsif (plugin::takeItems(13272 => 1)) {
		quest::say("Outstanding $name!! This should be of help to you.");
		#:: Randomly choose various mage level spells excluding pet item spells
		quest::summonitem(quest::ChooseRandom(15205,15211,15288,15310,15311,15313,15331,15050,15093,15315,15316,15058,15317,15318,15036,15094,15246,15322,15323,15325,15851,15324,15332,15400,15399,15398,15042,15613));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(245, 10); 	#:: + Eldritch Collective
		quest::faction(255, 10); 	#:: + Gem Choppers
		quest::faction(333, 10); 	#:: + King Ak'Anon
		quest::faction(238, -30); 	#:: - Dark Reflection
		quest::faction(239, -30); 	#:: - The Dead
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 1500 to 1600cp
		my %cash = plugin::RandomCash(1500,1600);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
