sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings! I am the keeper of this zoo. I advise you to stay on the upper tiers to observe the animals.");
	}
	elsif ($text=~/regurgitonic/i) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("I formulate the Regurgitonic myself. My animals kept eating the occasional spectator here and there. Femurs and ribs kept getting stuck inside, not to mention a few platinum pieces. Sometimes my batch would come out wrong and the animals would go berserk!! I hope I got the formula right this time.");
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 13945 - Flask of Nitrates
	if (plugin::takeItems(13945 => 1)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("The flask of nitrates I sent for!! As was the deal, here is my [Regurgitonic]. Give it to whoever may need it and they will surely cough up whatever may be inside them with no harm to them whatsoever.");
			#:: Give a 12140 - The Regurgitonic
			quest::summonitem(12140);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(255, 10); 		#:: + Gem Choppers
			quest::faction(288, 2); 		#:: + Merchants of Ak'Anon
			quest::faction(333, 2); 		#:: + King Ak'Anon
			quest::faction(238, -2); 		#:: - Dark Reflection
			quest::faction(1604, -1); 		#:: - Clan Grikbar
			#:: Grant a small amount of experience
			quest::exp(100);
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
			#:: Return a 13945 - Flask of Nitrates
			quest::summonitem(13945);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
