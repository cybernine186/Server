sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings! I am the operator of this scrapyard. If you have any scrap metal, I would be glad to purchase it from you in loads of four. The Gemchoppers no longer allow me to accept blackbox fragments and micro servos.");
	}
	elsif ($text=~/princess joleena/i) {
		quest::say("No!! You cannot have my magic Fairie Wing!! I need it. I read somewhere within the great library that the magic wing from a fairie princess will restore my full head of hair. Look at me!! I am bald!! I have no [friends] at all.");
	}
	elsif ($text=~/friends/i) {
		quest::say("Oh. You are just saying that so you can get my fairie wing. I will make you a deal. I cannot rely on this wing forever. I will trade it with you if you could get me a case of hair tonic. If you are a true friend you [will fetch the hair tonic] for me.");
	}
	elsif ($text=~/will fetch the hair tonic/i) {
		quest::say("Great!! Here you go, my friend. Take this crate and within you shall fill each slot with hair tonic. When all are combined within the crate, return it to me for your wing. I am not sure what the tonic was or where I got it. There is some writing on the crate, but I could not identify it.");
		#:: Give a 17979 - Crate for Tonics
		quest::summonitem(17979);
	}
}

sub EVENT_ITEM {
	#:: Match four 13198 - Scrap Metal
	if (plugin::takeItems(13198 => 4)) {
		quest::say("Grand! We always need more scraps to melt down. Here you are, then... Some coins for supporting Ak'Anon and a salvaged item from the scrapyard.");
		#:: Give a random reward: 5013 - Rusty Short Sword, 5014 - Rusty Axe, 5015 - Rusty Scythe, 5016 - Rusty Broad Sword, 5019 - Rusty Long Sword, 5020 - Rusty Battle Axe, 12340 - Gnome Glow Rod
		quest::summonitem(quest::ChooseRandom(5013, 5013, 5013, 5014, 5014, 5014, 5015, 5015, 5015, 5016, 5016, 5016, 5019, 5019, 5019, 5020, 5020, 5020, 12340, 12340));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 3); 		#:: + Gem Cutters
		quest::faction(288, 3); 		#:: + Merchants of Ak'Anon
		quest::faction(333, 3); 		#:: + King Ak'Anon
		quest::faction(238, -3); 		#:: - Dark Reflection
		quest::faction(1604, -3); 		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 1100 to 1200cp
		my %cash = plugin::RandomCash(1100,1200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}

	#:: Match a 12336 - Crate of Tonic
	elsif (plugin::takeItems(12336 => 1)) {
		quest::say("Huzzah!! You are my friend. Now you can take my old toupee and get it repaired. Just go to Freeport and ask Ping to [repair the toupee]. Hey!! You know what? He is the guy who sells the hair tonic!! I remember now. Well,.. Get my toupee repaired and I will give you the fairie wing.");
		#:: 12337 - Tattered Toupee
		quest::summonitem(12337); 
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 3); 		#:: + Gem Cutters
		quest::faction(288, 3); 		#:: + Merchants of Ak'Anon
		quest::faction(333, 3); 		#:: + King Ak'Anon
		quest::faction(238, -3); 		#:: - Dark Reflection
		quest::faction(1604, -3); 		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 1100 to 1200cp
		my %cash = plugin::RandomCash(1100,1200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 12254 - Mane Attraction
	elsif (plugin::takeItems(12254 => 1)) {
		quest::say("Double Huzzah!! You are a good friend $name. Now mayhaps I shall find myself a wife. Here pal, the fairy wing. I hope it can give you a great head of hair. You need it.");
		#:: 12339 - Glimmering Fairie Wing
		quest::summonitem(12339); 
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 3); 		#:: + Gem Cutters
		quest::faction(288, 3); 		#:: + Merchants of Ak'Anon
		quest::faction(333, 3); 		#:: + King Ak'Anon
		quest::faction(238, -3); 		#:: - Dark Reflection
		quest::faction(1604, -3); 		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 1100 to 1200cp
		my %cash = plugin::RandomCash(1100,1200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13216 - Scrap Metal and a 13217 - Scrap Metal
	elsif (plugin::takeItems(13216 => 1, 13217 => 1)) {
		quest::say("Good. The citizens of Ak'Anon are safe from those little critters. They may have injured someone; that is why they were deactivated. Here is something I found in the scrapyard. I hope you can find a purpose for it.");
		#:: Randomly choose one of Bootstrutter's Framed Pack or Forging Hammer
		quest::summonitem(quest::ChooseRandom(17981, 17981, 6027));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 3); 		#:: + Gem Cutters
		quest::faction(288, 3); 		#:: + Merchants of Ak'Anon
		quest::faction(333, 3); 		#:: + King Ak'Anon
		quest::faction(238, -3); 		#:: - Dark Reflection
		quest::faction(1604, -3); 		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 1100 to 1200cp
		my %cash = plugin::RandomCash(1100,1200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
