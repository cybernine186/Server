sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("What is this I see before me? A would-be hero of the Dead? You reek of false bravado. I have seen others much stronger than you meet their fate at the end of a blade. I see no reason to continue our conversation. How can one such as you assist with my [delegated duties]?");
	}
	elsif ($text=~/delegated duties/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Why do you ask? I know why. Glory has captured your affections. Those who seek glory find death. Still, you may be of some use. Before I assign you a task, I must be assured of your power. I require you to [perform a test].");
		}
		elsif ($faction == 5) {
			quest::say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		}
		else {
			quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
		}
	}
	elsif ($text=~/perform a test/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("In the Lavastorm Mountain Range there have been sightings of a paladin, one Sir Lindeal. He has compromised our routes between.. well, that is none of your concern. All you need to know is that this paladin of the Temple of Marr must be sent to his everlasting life. Do so and prove your worth to us. I await your proof. Use no assistance. If you are truly his equal then I shall know. I know all.");
		}
		elsif ($faction == 5) {
			quest::say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		}
		else {
			quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
		}
	}
	elsif ($text=~/appointed tasks/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Very well. You have gained the appropriate power. I require you to journey to the Commonlands and seek out Kizdean Gix. He is a member of a very important force. Tell him 'Utalk Adarev Otcin'. Remember this password.");
		}
		elsif ($faction == 5) {
			quest::say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		}
		else {
			quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
		}
	}
	elsif ($text=~/thex mallet/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("All you can know is that the Thex Mallet is desired by our Queen. If we are not successful in its retrieval, it will be our heads which adorn her trophy room. We have learned its location and believe it to be broken into three separate pieces.");
		}
		elsif ($faction == 5) {
			quest::say("When you learn to serve the Dead, then I will find the time to speak of such things.");
		}
		else {
			quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
		}
	}
	elsif ($text=~/queen cristanos thex/i) {
		quest::say("The Queen of the Teir'Dal is the most powerful of all. It is she who should sit on the throne and not King Naythox. The Dead are her humble servants. We await the day when she shall finally take her rightful position as ruler of Neriak.");
	}
	elsif ($text=~/king naythox thex/i){
		quest::say("A competent and powerful warrior, but a warrior nonetheless. He has suppressed the true glory of the Teir'Dal. Perhaps it is time for a new ruler of Neriak.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18828 - Testimony
	if (plugin::takeItems(18828 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("So you have succeeded where others have failed. You show promise. Take this then. You shall be a valuable asset to the Dead and soon this shall be of value to one so great. This will help you on your way. Are you still interested in my [appointed tasks]?");
			#:: Give a 2317 - Cloak of the Undead Eye
			quest::summonitem(2317);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(239, 25);			#:: + The Dead
			quest::faction(303, 3);				#:: + Queen Cristanos Thex
			quest::faction(278, -3);			#:: - King Naythox Thex
			quest::faction(275, -3);			#:: - Keepers of the Art
			quest::faction(245, -3);			#:: - Eldritch Collective
			quest::faction(1522,-50);			#:: - Primordial Malice
			#:: Grant a small amount of experience
			$client->AddLevelBasedExp(1, 16);
			#:: Create a hash for storing cash - 1400 to 1600cp
			my %cash = plugin::RandomCash(1400,1600);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		#:: Else eat it.
	}
	#:: Match a 13390 - Thex Mallet
	elsif (plugin::takeItems(13390 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			#:: Create a scalar variable to store a random number
			my $RandomChance = quest::ChooseRandom(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
			#:: Match if the random number is less than ten (90 percent)
			if ($RandomChance < 10) {
				quest::say("Oh how grand it is!! Look at it!! I feel the power trembling within. Who would have thought such an item would be abandoned? You have performed supremely. Queen Cristanos shall reward me greatly and I shall reward you greatly. Here is my weapon from years past.. the Reaper of the Dead. I believe it has one soul still trapped within.");
				#:: Give a 5374 - Reaper of the Dead
				quest::summonitem(5374);
			}
			#:: Match if the random number is 10 (10 percent)
			else {
				quest::say("Oh how grand it is!! Look at it!! I feel the power trembling within. Who would have thought such an item would be abandoned? You have performed supremely. Queen Cristanos shall reward me greatly and I shall reward you greatly. Here is my ring from years past.. the Ring of the Dead. I believe it has one soul still trapped within.");
				#:: Give a 13394 - Ring of the Dead
				quest::summonitem(13394);
			}
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(239, 100);			#:: + The Dead
			quest::faction(303, 15);			#:: + Queen Cristanos Thex
			quest::faction(278, -15);			#:: - King Naythox Thex
			quest::faction(275, -15);			#:: - Keepers of the Art
			quest::faction(245, -15);			#:: - Eldritch Collective
			quest::faction(1522, -200);			#:: - Primordial Malice
			#:: Grant a small amount of experience
			$client->AddLevelBasedExp(1, 16);
			#:: Create a hash for storing cash - 1400 to 1600cp
			my %cash = plugin::RandomCash(1400,1600);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		#:: Else eat it.
	}
	#:: Match a 18889 - Sealed Letter
	elsif (plugin::takeItems(18889 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I see my expeditionary unit has encountered problems. I must send a dragoon unit to [Befallen] at once. I must not allow the Thex Mallet] to fall into the hands of some simple adventurer. Here is payment for your quick service.");
			#:: Give two 13009 - Bandages
			quest::summonitem(13009, 2);
			#:: Give two 13005 - Iron Ration
			quest::summonitem(13005, 2);
			#:: Give a 13002 - Torch
			quest::summonitem(13002);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(239, 10);			#:: + The Dead
			quest::faction(303, 1);				#:: + Queen Cristanos Thex
			quest::faction(278, -1);			#:: - King Naythox Thex
			quest::faction(275, -1);			#:: - Keepers of the Art
			quest::faction(245, -1);			#:: - Eldritch Collective
			quest::faction(1522, -20);			#:: - Primordial Malice
			#:: Grant a small amount of level-based experience
			$client->AddLevelBasedExp(1, 16);
			#:: Create a hash for storing cash - 1 to 10cp
			my %cash = plugin::RandomCash(1,10);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		#:: Else eat it
	}
  	#:: plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	#:: Return unused items
	plugin::returnUnusedItems();
}
