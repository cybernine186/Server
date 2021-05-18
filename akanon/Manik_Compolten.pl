sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say("Greetings, young one. I am Manik Compolten, High Watchman. Are you a [new warrior] or an [experienced fighter]?");
	}
	elsif ($text=~/new warrior/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("It is always good to see new blood amongst the Gemchoppers. I have a small task for you. Take this keycard. I will give you only one at a time. Use each to obtain blackboxes for the C series clockworks. I am sure you are familiar with the clockworks. When you are done, bring them all to me. Let me know if you need another keycard.");
			#:: Give a 13844 - Shiny Card
			quest::summonitem(13844);
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	}
	elsif ($text=~/keycard/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Here. Remember, I will give you only one keycard at a time. These keycards only work for the C series clockworks.");
			#:: Give a 13844 - Shiny Card
			quest::summonitem(13844);
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	}
	elsif ($text=~/experienced fighter/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Good. I require your talents to destroy rogue clockworks. After we sent the clockworks to destroy the Asylum of the Mad we found some of the clockworks went haywire and never returned. We must destroy them, not for the safety of the people, but to keep our technology from falling into the hands of any other nation. Go to the Steamfont Mountains and return their rogue blackboxes to me.");
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	}
	elsif ($text=~/asylum of the mad/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("They are the madmen of Meldrath. While he built the Titan they kept the Watchmen busy with frequent murders and senseless destruction. The Watchmen finally directed the Clockworks to destroy this band of madmen. Some may still be found praising the name of Meldrath as their dagger slices through innocent flesh.");
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	}
	elsif ($text=~/meldrath/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Meldrath was once the leader of the Wizards of this guild. He was absorbed by his work on [other worlds]. It is said that he found something in the sky. Whatever he saw caused a madness, he soon took flight and formed the [Asylum of the Mad]. Most believe he is deceased, we know better. Tobon is intent on finding him.");
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	}
	elsif ($text=~/other worlds/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("We of the Eldritch Collective have been studying the skies for some time. Our Observers can be found scattered among the landscape. We believe there may be other worlds of great technology, but to reach there will require great technology.");
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	}
	elsif ($text=~/clockwork/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("The clockworks were developed by the Eldritch Collective. They are used as our policing force in Ak'Anon. They come in many series. The letter following their number is the series model.");
		}
		else {
			quest::say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 13208 - Rusted Blackbox
	if (plugin::takeItems(13208 => 1)) {
		quest::say("Ah! Excellent work! I think we may have further use for you if you like.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 3); 		#:: + Gem Choppers
		quest::faction(288, 10); 		#:: + Merchants of Ak'Anon
		quest::faction(333, 3); 		#:: + King Ak'Anon
		quest::faction(238, -10); 		#:: - Dark Reflection
		quest::faction(1604, -10);		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 130 to 170cp
		my %cash = plugin::RandomCash(130,170);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13212 - Blackbox XIIC, a 13211 - Blackbox XXVIC, a 13213 - Blackbox XVIIC, and a 13214 - Blackbox XXVIIC
	elsif (plugin::takeItems(13212 => 1, 13211 => 1, 13213 => 1, 13214 => 1)) {
		quest::say("Ah!! I see you had no problem finding all of the C series clockworks. Good work. Here. Take this blackbox. We received it from Clockwork 27C. Take it to Jogl Doobraugh. He is the operator of the only blackbox definer in Ak'Anon. He is out at the windmills checking on their operation.");
		#:: Give a 13209 - Blackbox XXVIIC (Blackbox for 27C Returned)
		quest::summonitem(13209);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 1); 		#:: + Gem Choppers
		quest::faction(288, 1); 		#:: + Merchants of Ak'Anon
		quest::faction(333, 1); 		#:: + King Ak'Anon
		quest::faction(238, -1); 		#:: - Dark Reflection
		quest::faction(1604, -1); 		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(5000);
		#:: Create a hash for storing cash - 5 to 10cp
		my %cash = plugin::RandomCash(5,10);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13215 - Rusted Black Box - Red V Clockwork
	elsif (plugin::takeItems(13215 => 1)) {
		quest::say("This is fabulous news!! You have done well, young one.");
		#:: Give a random reward: 13219 - Bull Smasher, 13220 - Iony's Absorber, 1013 - Small Cloth Cap, 1018 - Small Cloth Cape, 1015 - Small Cloth Choker, 1019 - Small Cloth Cord, 1022 - Small Cloth Gloves, 
		#:: 1023 - Small Cloth Pants, 1024 - Small Cloth Sandals, 1017 - Small Cloth Shawl, 1016 - Small Cloth Shirt, 1020 - Small Cloth Sleeves, 1014 - Small Cloth Veil, 1021 - Small Cloth Wristband
		quest::summonitem(quest::ChooseRandom(13219, 13219, 13220, 13220, 1013, 1018, 1015, 1019, 1022, 1023, 1024, 1017, 1016, 1020, 1014, 1021));
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(255, 1); 		#:: + Gem Choppers
		quest::faction(288, 1); 		#:: + Merchants of Ak'Anon
		quest::faction(333, 1); 		#:: + King Ak'Anon
		quest::faction(238, -1); 		#:: - Dark Reflection
		quest::faction(1604, -1); 		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(5000);
		#:: Create a hash for storing cash - 130 to 170cp
		my %cash = plugin::RandomCash(130,170);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13212 - Blackbox XIIC, or a 13211 - Blackbox XXVIC, or a 13213 - Blackbox XVIIC, or a 13214 - Blackbox XXVIIC
	elsif (plugin::takeItems(13212 => 1) || plugin::takeItems(13211 => 1) || plugin::takeItems(13213 => 1) || plugin::takeItems(13214 => 1)) {
		quest::say("A generous offer. Thank you for your donations to Gemchopper Hall. I shall have this recyled.");
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
