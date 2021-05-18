sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Well met. $name!  I am Vacto Molunel.  If you are seeking to outfit yourself with the finest weapons in all of Kaladim, I am the one to see.  I also posses a [rare talent] you might find useful.");
	}
	elsif ($text=~/rare talent/i) {
		quest::say("Piqued your interest. did I?  Well. you see. I am one of the few dwarves who possess the knowledge and talent to craft a unique type of armor entirely out of scarab carapaces.  While my specialty is making [scarab helms], I have also been convinced to make [scarab breastplates] and [scarab boots] from time to time.  All of the pieces I craft are to dwarven proportions, but I have had some gnomish and halfling customers as well.  They come from all over for my armor.");
	}
	elsif ($text=~/scarab helms/i) {
		quest::say("Interested in a scarab helm. are you?  Well, because my talent is so unique and my time is so valuable, I am afraid I could only make you a helm if you were to provide me with the two scarab carapaces necessary to accommodate a head such as yours.  I will also need a payment of 5 gold pieces.  The Butcherblocks are crawling with worker scarabs that have just the right size carapaces for our needs.");
	}
	elsif ($text=~/scarab breastplates/i) {
		quest::say("Ah..  A  scarab breastplate.. hmm.  Well, if you want to convince me to go though the trouble of crafting one of those, not only will you have to pay my fee of 23 gold pieces, you must provide me with a pristine giant scarab carapace.  I refuse to make a breastplate with cracked carapaces."); 
	}
	elsif ($text=~/scarab boots/i) {
		quest::say("Ah..  Scarab Boots.. hmm.  Well, if you want to convince me to go though the trouble of crafting a pair of those, not only will you have to pay my fee of 17 gold pieces, you must provide me with a cracked giant scarab shell and 2 scarab legs."); 
	}
}

sub EVENT_ITEM {
	#:: Match two 13849 - Scarab Carapace and 5 gold
	if (plugin::takeItemsCoin(0,0,5,0, 13849 => 2)) {
		quest::say("Excellent. Here is your helm. Wear it with pride! And be sure to occasionally wipe out the insulating mucus that tends to build up on its underside. It will make your hair fall out. One more thing, would you be interested in [scarab boots] to match your helm?");
		#:: Give a 2175 - Small Scarab Helm
		quest::summonitem(2175); 
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(312, 2);			#:: + Storm Guard
		quest::faction(274, 1);			#:: + Kazon Stormhammer
		quest::faction(293, 1);			#:: + Miners Guild 249
		quest::faction(290, 1);			#:: + Merchants of Kaladim
		quest::faction(232, -1);		#:: - Craknek Warriors
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Match a 13132 - Cracked Giant Scarab Carapace, two 13848 - Scarab Legs, and 17 gold
	elsif (plugin::takeItemsCoin(0,0,17,0, 13132 => 1, 13848 => 2)) {
		quest::say("Very good! Let me see here. Thread the legs around like this and... There you go. Wear them with pride!");
		#:: Give a 2177 - Small Scarab Boots
		quest::summonitem(2177);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(312, 3);			#:: + Storm Guard
		quest::faction(274, 1);			#:: + Kazon Stormhammer
		quest::faction(293, 1);			#:: + Miners Guild 249
		quest::faction(290, 1);			#:: + Merchants of Kaladim
		quest::faction(232, -1);		#:: - Craknek Warriors
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Match a 13133 - Pristine Giant Scarab Carapace and 23 gold
	elsif (plugin::takeItemsCoin(0,0,23,0, 13133 => 1)) {
		quest::say("If I do say so myself, this is one of the finest breastplates in all of Norrath. I am truly a master at my craft. You might want to wipe out some of the excess scarab goo before wearing it, though.");
		#:: Give a 2176 - Small Scarab Breastplate
		quest::summonitem(2176); 
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(312, 5);			#:: + Storm Guard
		quest::faction(274, 1);			#:: + Kazon Stormhammer
		quest::faction(293, 1);			#:: + Miners Guild 249
		quest::faction(290, 1);			#:: + Merchants of Kaladim
		quest::faction(232, -1);		#:: - Craknek Warriors
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
