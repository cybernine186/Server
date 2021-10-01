sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("It is good to meet you, $name. You, my friend, are an adventurer. The rugged look of you testifies to that. Let me know if you plan to adventure in the Plains of Karana. I have need of a person such as yourself to [deliver a flask].");
	}
	elsif ($text=~/deliver a flask/i) {
		quest::say("That is splendid! I thought I would have to take the long journey to the western Plains of Karana myself. Here you are, my friend. Take this flask of nitrates to a woman named Linaya Sowlin. It will help her crops grow stronger. You will find her farm alongside the road to Highpass Hold. She should pay you well for the delivery. Farewell.");
		#:: Give a 13945 - Flask of Nitrates
		quest::summonitem(13945);
	}
	elsif ($text=~/unkempt druids/i) {
		quest::say("The Unkempt Druids are a radical splinter group of druids. Their beliefs have been contorted by the mad druid [Jale Phlintoes]. It is he who engineers and coordinates the druids' transgressions. From setting lumbermills aflame to murdering any man who dares to wear a bearhide. They must be stopped!! Citizens must learn to understand Tunare's will, not fear it.");
	}
	elsif ($text=~/jale phlintoes/i) {
		quest::say("Jale Phlintoes was trained in the ways of the Jaggedpine Treefolk since his birth. He was only eight when his parents were killed by poachers. Young Jale would have had his throat slit also if he were not off fishing at the lake. Unfortunate. The now orphaned Jale was brought up by us druids. After many conflicts with our council, he ran off to start his own sect somewhere in the nearby lands. For his terrorist activities his head now brings a high price.");
	}
	elsif ($text=~/linaya/i) {
		quest::say("Linaya Sowlin is an old student of mine. When her father passed away she inherited his farmhouse in The Plains of Karana. A tent in the Jaggedpine or an estate on the plains? I would choose the former.");
	}
	elsif ($text=~/nitrates/i) {
		quest::say("It is nothing more than a special elixir for plants only.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18911 - Tattered Cloth Note
	if (plugin::takeItems(18911 => 1)) {
		quest::say("Oh my!! Our Qeynos Ambassador, Gash, is in danger. Please take the note over to Captain Tillin of the Qeynos Guard then find Gash and inform him [they are trying to kill him]. Go!!");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(272, 15); 	#:: + Jaggedpine Treefolk
		quest::faction(302, 3); 	#:: + Protectors of Pine
		quest::faction(343, 2); 	#:: + QRG Protected Animals
		quest::faction(324, -3); 	#:: - Unkempt Druids
		quest::faction(262, 2); 	#:: + Guards of Qeynos
		#:: Grant a small amount of experience, based on level
		$client->AddLevelBasedExp(1, 46);
		#:: Create a hash for storing cash - 100 to 200cp
		my %cash = plugin::RandomCash(100,200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 12141 - Black Wood Chip
	elsif (plugin::takeItems(12141 => 1)) {
		quest::say("So the Unkempt Druids are alive and well.  We shall keep a watchful eye out as should you.  Take this for your bravery and defense of the Jaggedpine.");
		#:: Give a random reward: 6018 - Cracked Staff, 2006 - Leather Cloak, 2147 - Raw-hide Leggings, 9002 - Round Shield, 9006 - Wooden Shield, 15237 - Spell: Dance of the Fireflies, 15239 - Spell: Flame Lick, 15252 - Spell: Invoke Lightning, 15240 - Spell: Lull Animal, 15248 - Spell: Ward Summoned
		quest::summonitem(quest::ChooseRandom(6018, 2006, 2147, 9002, 9006, 15237, 15239, 15252, 15240, 15248));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(272, 20); 	#:: + Jaggedpine Treefolk
		quest::faction(302, 5); 	#:: + Protectors of Pine
		quest::faction(343, 3); 	#:: + QRG Protected Animals
		quest::faction(324, -5); 	#:: - Unkempt Druids
		quest::faction(262, 3); 	#:: + Guards of Qeynos
		#:: Grant a small amount of experience, based on level
		$client->AddLevelBasedExp(1, 46);
		#:: Create a hash for storing cash - 250 to 300cp
		my %cash = plugin::RandomCash(250,300);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 18864 - Sealed Letter
	elsif (plugin::takeItems(18864 => 1)) {
		quest::say("So the Unkempt Druids are alive and well.  We shall keep a watchful eye out as should you.  Take this for your bravery and defense of the Jaggedpine.");
		#:: Give a random reward: 6018 - Cracked Staff, 2006 - Leather Cloak, 2147 - Raw-hide Leggings, 9002 - Round Shield, 9006 - Wooden Shield, 15237 - Spell: Dance of the Fireflies, 15239 - Spell: Flame Lick, 15252 - Spell: Invoke Lightning, 15240 - Spell: Lull Animal, 15248 - Spell: Ward Summoned
		quest::summonitem(quest::ChooseRandom(6018, 2006, 2147, 9002, 9006, 15237, 15239, 15252, 15240, 15248));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(272, 15); 	#:: + Jaggedpine Treefolk
		quest::faction(302, 3); 	#:: + Protectors of Pine
		quest::faction(343, 2); 	#:: + QRG Protected Animals
		quest::faction(324, -3); 	#:: - Unkempt Druids
		quest::faction(262, 2); 	#:: + Guards of Qeynos
		#:: Grant a small amount of experience, based on level
		$client->AddLevelBasedExp(1, 46);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
