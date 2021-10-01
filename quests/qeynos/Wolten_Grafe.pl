sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, noble $name. Remember to spread the words of Karana throughout the faraway lands on which you shall tread. We of the Temple of Thunder are looking for new members - good people who [wish to join the cause]. Let the call go out!");
	}
	elsif ($text=~/join the cause/i) {
		quest::say("That IS good news! If you walk the righteous path of the Rainkeeper, Karana, then you are truly noble. I have need of someone like that. I must find someone to perform a [dangerous mission] or perhaps you would rather seek out the [Rat King] or [crush the undead].");
	}
	elsif ($text=~/dangerous mission/i) {
		quest::say("You must go into the catacombs and find a man named Drosco Finlayer. Pass him this note. He has been deep undercover in the Shrine of Bertoxxulous and will have directions to that vile place. To do this will surely show your allegiance to this temple.");
		#:: Give a 18804 - Tattered Note
		quest::summonitem(18804);
	}
	elsif ($text=~/rat king/i) {
		quest::say("You are truly brave, young knight. Go to the catacombs. Find the Rat King. Bring me his head as proof of your noble deed. He must be stopped. Beware of his allies. May Karana watch over you.");
	}
	elsif ($text=~/crush the undead/i) {
		quest::say("Those who passed generations ago have had their bones exhumed and enchanted. Some evil force plagues this land with these evil skeletons. You will fight for us and crush the skeletons. Take this box and fill it with the bones of those creatures. We will not allow them to rise again and you shall earn our respect. Go forth and fight for Karana!");
		#:: Give a 17941 - Box For Bones
		quest::summonitem(17941);
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 4) {
		quest::say("Your Excellency, we need to recruit a newcomer to find and infiltrate the Shrine of Bertoxxulous. The Shrine's eyes are watching all our moves.");
		#:: Send a signal "1" to South Qeynos >> Runethar_Hamest (1128) with no delay
		quest::signalwith(1128,1,0);
	}
}

sub EVENT_ITEM {
	#:: Match a 13882 - Box of Bones
	if (plugin::takeItems(13882 => 1)) {
		quest::say("You have done well. Let it be known to all that you fight for the Rainkeeper. Go and continue the battle.");
		#:: Give a 13006 - Water Flask
		quest::summonitem(13006);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, 10);	#:: + Knights of Thunder
		quest::faction(221, -10);	#:: - Bloodsabers
		quest::faction(341, 7);		#:: + Priests of Life
		quest::faction(262, 7);		#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 20 to 30cp
		my %cash = plugin::RandomCash(20,30);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 18805 - Sealed Letter
	elsif (plugin::takeItems(18805 => 1)) {
		quest::say("This is terrible news. It is good you did not find your grave in the catacombs. You completed your mission regardless of the odds of survival. The temple thanks you. We shall still require your service, Knight of Thunder. Events have transpired which put all agents of righteousness in danger. We cannot explain all as yet. Take this note to Freeport. You will give it to Eestyana Naestra at the Hall of Truth. Beware, now. The Shrine of Bertoxxulous now knows of your allegiance. Give me any other item you may have found on Drosco's body.");
		#:: Give a 18822 - Note
		quest::summonitem(18822);
		#:: "Sometimes" give a 6357 - Thunder Staff
		#:: Create a scalar variable to store a random number 1-5
		my $randomChance = quest::ChooseRandom(1,2,3,4,5);
		#:: Match if 5 (20 percent chance)
		if ($randomChance > 4) {
			#:: Give a 6357 - Thunder Staff
			quest::summonitem(6357);
		}
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, 50);	#:: + Knights of Thunder
		quest::faction(221, -50);	#:: - Bloodsabers
		quest::faction(341, 37);	#:: + Priests of Life
		quest::faction(262, 37);	#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 650 to 850cp
		my %cash = plugin::RandomCash(650,850);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13288 - Order of Thunder
	elsif (plugin::takeItems(13288 => 1)) {
		quest::say("Ahh. Drosco's Order of Thunder. You are truly an honorable knight. Many vile people would pay greatly for this medal. I thank you for its return. I shall honor you by rewarding you with a thunder staff. Meant for young clerics and paladins of this temple. Never let it leave your side.");
		#:: Give a 6357 - Thunder Staff
		quest::summonitem(6357);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, 50);	#:: + Knights of Thunder
		quest::faction(221, -50);	#:: - Bloodsabers
		quest::faction(341, 37);	#:: + Priests of Life
		quest::faction(262, 37);	#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 650 to 850cp
		my %cash = plugin::RandomCash(650,850);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13396 - Human Head
	elsif (plugin::takeItems(13396 => 1)) {
		quest::say("We have finally destroyed the Rat King. You have performed a great service to Qeynos. Here is a small reward. Please continue with the work of the Rainkeeper.");
		#:: Give a random reward:  2112 - Patchwork Boots, 2106 - Patchwork Cloak, 2111 - Patchwork Pants, 2104 - Patchwork Tunic, 2108 - Patchwork Sleeves
		quest::summonitem(quest::ChooseRandom(2112, 2106, 2111, 2104, 2108));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, 50);	#:: + Knights of Thunder
		quest::faction(221, -50);	#:: - Bloodsabers
		quest::faction(341, 37);	#:: + Priests of Life
		quest::faction(262, 37);	#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
