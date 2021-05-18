sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings. I am Astaed Wemor of the Paladins of the Temple of Life. We are the defenders of the all-giving Prime Healer.  Are you [here to pray] or are you [here to assist the temple]?");
	}
	elsif ($text=~/here to pray/i) {
		quest::say("Then pray long and silently, $name.  Fill your soul with the breath of life.");
	}
	elsif ($text=~/assist the temple/i) {
		quest::say("Good.  There are a few in the congregation who require assistance.  Will you be [traveling afar] or are you [staying close to Qeynos]?");
	}
	elsif ($text=~/traveling afar/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Then outfit yourself well. We will require you to visit Rivervale, the village of the halflings. There you shall find an herb merchant named Kizzie Mintopp. She has an ingredient we require. Tell her you are from the Temple of Life");
		}
		else {
			quest::say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.  Perhaps you can assist us in ridding the land of diseased animals.  Priestess Caulria will accept all pelts from rabid beasts."); 
		}
	}
	elsif ($text=~/staying close/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Then you can help with one of our distraught members. The priests have noticed that Nerissa Clothspinner has been a little down lately. Go console her and ask her how she is doing. She is a sweet girl and the temple is worried about her.");
		}
		else {
			quest::say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.  Perhaps you can assist us in ridding the land of diseased animals.  Priestess Caulria will accept all pelts from rabid beasts."); 
		}
	}
	elsif ($text=~/fleshy orb/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I do not know what you are talking about. Let me see it.");
		}
		else {
			quest::say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.  Perhaps you can assist us in ridding the land of diseased animals.  Priestess Caulria will accept all pelts from rabid beasts."); 
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 18862 - Tattered Note
	if (plugin::takeItems(18862 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("So you have helped Nerissa. That is good. Here, then, is a small reward. May you find it useful. Keep fighting the good fight!");
			#:: Give a 6022 - Bronze Warhammer
			quest::summonitem(6022);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(341, 5);			#:: + Priests of Life
			quest::faction(280, 1);			#:: + Knights of Thunder
			quest::faction(262, 2);			#:: + Guards of Qeynos
			quest::faction(221, -1);		#:: - Bloodsabers
			quest::faction(219, 1);			#:: + Antonius Bayle
			#:: Grant a moderate amount of experience
			quest::exp(4000);
			#:: Create a hash for storing cash - 700 to 900cp
			my %cash = plugin::RandomCash(700,900);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			quest::say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.");
			#:: Return a 18862 - Tattered Note
			quest::summonitem(18862);
		}
	}
	#:: Match a 13952 - Honey Jum
	elsif (plugin::takeItems(13952 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I pray to Rodcet Nife that you have made it back in time. Let's add a small amount of this honey jum to this and.. here is the potion. This potion must be taken to a sick member of the congregation. The man is Lempeck Hargrin. He lives in the west plains of Karana between the river and the crop fields. He is in dire need of this potion. He has an odd disease. We have tried everything to cure him and this is his last chance. Run to him.");
			#:: Give a 13954 - Prime Healer Potion
			quest::summonitem(13954);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(341, 20);		#:: + Priests of Life
			quest::faction(280, 6);			#:: + Knights of Thunder
			quest::faction(262, 10);		#:: + Guards of Qeynos
			quest::faction(221, -5);		#:: - Bloodsabers
			quest::faction(219, 3);			#:: + Antonius Bayle
			#:: Grant a moderate amount of experience
			quest::exp(1000);
			#:: Create a hash for storing cash - 40 to 60cp
			my %cash = plugin::RandomCash(40,60);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			quest::say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.");
			#:: Return a 13952 - Honey Jum
			quest::summonitem(13952);
		}
	}
	#:: Match a 13970 - Rusty Scythe
	elsif (plugin::takeItems(13970 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("It is good to know that we saved Lempeck. He has given us his scythe as a donation to the temple. We shall find a use for it. As for your fine work at preserving the life of another, I reward you with the Shining Star of Life. Should you ever desire more strength in battle, call upon it to give you strength, but let it be known that at battle's end, you shall feel weaker than before you called upon the power. Just for a short time. When the power is drained, go to our temple storehouse and ask Whysia to [recharge the Shining Star of Life]. Go and serve life.");
			#:: Give a 6356 - Shining Star of Light
			quest::summonitem(6356);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(341, 20);		#:: + Priests of Life
			quest::faction(280, 6);			#:: + Knights of Thunder
			quest::faction(262, 10);		#:: + Guards of Qeynos
			quest::faction(221, -5);		#:: - Bloodsabers
			quest::faction(219, 3);			#:: + Antonius Bayle
			#:: Grant a moderate amount of experience
			quest::exp(1000);
			#:: Create a hash for storing cash - 800 to 850cp
			my %cash = plugin::RandomCash(800,850);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			quest::say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.");
			#:: Return a 13970 - Rusty Scythe
			quest::summonitem(13970);
		}
	}
	#:: Match a 13950 - Fleshy Orb
	elsif (plugin::takeItems(13950 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("This is very odd. I believe I have seen Priestess Caulria studying similar orbs. Take it to her. She is in the temple.");
			#:: Give back a 13950 - Fleshy Orb
			quest::summonitem(13950);
		}
		else {
			quest::say("I do not dislike you, but I cannot fully trust one who has yet to prove his service to the Prime Healer.");
			#:: Return a 13950 - Flehsy orb
			quest::summonitem(13950);
		}		
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
© 2021 GitHub, Inc.