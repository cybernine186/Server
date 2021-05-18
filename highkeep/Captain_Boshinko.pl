sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings. stranger! Are you the [bounty hunter I requested]?");
	}
	elsif ($text=~/bounty hunter/i) {
		quest::say("It is about time. I have been waiting for you for ages! Your [reputation] precedes you.");
	}
	elsif ($text=~/reputation/i) {
		quest::say("You humor me, $name! I would have guessed someone like yourself would have little time for humor. Nevertheless, would you [like to hear about the job] I have for you?");
	}
	elsif ($text=~/about the job/i) {
		#:: Match if faction is Amiable or better
		if ($faction <=4) {
			quest::say("A prisoner named Bronin Higginsbot, a halfling, recently escaped. He was a small time thief and I would care less if it were not for the fact that in the process of obtaining the cell key, he disemboweled my finest guard. We found the bloodied shank still stuck in my guard's gutted corpse. Would you [like to know more]?");
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("You must be new to Highhold. We will trust you when we hear your blade has cut down many Karana bandits or assisted our gatehouse guards with their tasks.");
		}
		else {
			quest::say("Your name is as respected as the name of the Karana bandits. Leave my presence while you still have legs to run with.");
		}
	}
	elsif ($text=~/like to know more/i) {
		#:: Match if faction is Amiable or better
		if ($faction <=4) {
			quest::say("That little man has now made it to Rivervale. He has ties with the halfling rogues, obviously. I want you to find him.  When you find him, take this shank he used to kill my guard and hand it to him. I want him to know why he is about to die. No one escapes my prison!! Bring me his head and I shall pay the bounty.");
		#:: Summon the Bloody Shank
		quest::summonitem(13110);
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("You must be new to Highhold. We will trust you when we hear your blade has cut down many Karana bandits or assisted our gatehouse guards with their tasks.");
		}
		else {
			quest::say("Your name is as respected as the name of the Karana bandits. Leave my presence while you still have legs to run with.");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 13111 - Halfling Head
	if (plugin::takeItems(13111 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Good work, bounty hunter! You have served your legend well. I hope a few plat is good enough and, please, take this item we confiscated from one of our guests now serving time in our dungeon.");
			#:: Give a random reward: 2314 - Bearskin Gloves, 7321 - Scouts Blade, 5300 - Dwarven Axe, 6302 - Oger War Maul
			quest::summonitem(quest::ChooseRandom(2314,2314,2314,7321,5300,6302));
			#:: Ding
			quest::ding();
			#:: Set factions
			quest::faction(332, 20);		#:: + Highpass Guards
			quest::faction(329, 3);			#:: + Carson McCabe
			quest::faction(331, 3);			#:: + Merchants of Highpass
			quest::faction(230, 1);			#:: + Corrupt Qeynos Guards
			quest::faction(330, 1);			#:: + The Freeport Militia
			#:: Grant a small amount of experience
			quest::exp(250);
			#:: Create a hash for storing cash - 2500 to 3500cp
			my %cash = plugin::RandomCash(2500,3500);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("You must be new to Highhold. We will trust you when we hear your blade has cut down many Karana bandits or assisted our gatehouse guards with their tasks.");
			#:: Return a 13111 - Halfling Head
			quest::summonitem(13111);
		}
		else {
			quest::say("Your name is as respected as the name of the Karana bandits. Leave my presence while you still have legs to run with.");
			#:: Return a 13111 - Halfling Head
			quest::summonitem(13111);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
