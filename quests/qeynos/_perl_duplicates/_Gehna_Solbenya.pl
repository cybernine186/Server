sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings and blessings to you, $name. Karana offers you his protection and guidance. All who accept the offer shall find safe haven within our Temple of Thunder, If you are a cleric of Karana, you must have a [desire to serve] Karana's flock.");
	}
	elsif ($text=~/desire to serve/i) {
		quest::say("If you are a young acolyte, you may [deliver blessings to the flock] and if you are a skilled cleric, we need you to [hunt bandit binders].");
	}
	elsif ($text=~/deliver blessings/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Then go to the Plains of Karana. It is there that the blessings are needed. Ask every resident of the plains if they are followers of Karana. If they are, then ask them if they [require Karana's blessings]. Let them drink from this temple chalice. Return the empty chalice to me and you shall never go thirsty again.");
			#:: Give a 12103 - Full Chalice
			quest::summonitem(12103);
		}
		#:: Match if faction is Indifferent or worse
		elsif ($faction > 4) {
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		}
	}
	elsif ($text=~/hunt bandit/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Go to the Plains of Karana and seek out the Karana Bandits. Among them can be found their bandit binders. They are healers of sorts. Which evil deity granted them this power is unknown to us. Each carries a binder spectacle. I shall reward clerics for every two returned spectacles. Perhaps a new power may even be bestowed.");
		}
		#:: Match if faction is Indifferent or worse
		elsif ($faction > 4) {
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 12104 - Empty Chalice
	if (plugin::takeItems(12104 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("You have done a good service for the flock of Karana. Study the words upon this scroll and soon Karana shall keep you from thirst.");
			#:: Give a random reward:  15211 - Spell: Summon Drink, 15201 - Spell: Flash of Light, 15207 - Spell: Divine Aura, 15050 - Spell: Summon Food, 15219 - Spell: Center
			quest::summonitem(quest::ChooseRandom(15211, 15201, 15207, 15050, 15219));
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(280, 10);		#:: + Knights of Thunder
			quest::faction(221, -10);		#:: - Bloodsabers
			quest::faction(341, 7);			#:: + Priests of Life
			quest::faction(262, 7);			#:: + Guards of Qeynos
			#:: Grant a small amount of experience
			quest::exp(500);
			#:: Create a hash for storing cash - 80 to 100cp
			my %cash = plugin::RandomCash(80,100);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		#:: Match if faction is Indifferent or worse
		elsif ($faction > 4) {
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
			#:: Return a 12104 - Empty Chalice
			quest::summonitem(12104);
		}
	}
	#:: Match four 12101 - Spectacle
	elsif (plugin::takeItems(12101 => 4)) {
		quest::say("The bounty will not be paid unless two spectacles are received.");
		#:: Return four 12101 - Spectacle
		quest::summonitem(12101);
		quest::summonitem(12101);
		quest::summonitem(12101);
		quest::summonitem(12101);
	}
	#:: Match three 12101 - Spectacle
	elsif (plugin::takeItems(12101 => 3)) {
		quest::say("The bounty will not be paid unless two spectacles are received.");
		#:: Return three 12101 - Spectacle
		quest::summonitem(12101);
		quest::summonitem(12101);
		quest::summonitem(12101);
	}
	#:: Match two 12101 - Spectacle
	elsif (plugin::takeItems(12101 => 2)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Excellent work. These foul men have no right to be proficient in the ways of healing. Here then is your bounty. Use it in your continued war against the Karana bandits.");
			#:: Give a random reward:  15219 - Spell: Center, 15226 - Spell: Endure Disease, 15485 - Spell: Symbol of Transal, 15227 - Spell: Endure Poison
			quest::summonitem(quest::ChooseRandom(15219, 15226, 15485, 15227));
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(280, 20);		#:: + Knights of Thunder
			quest::faction(221, -20);		#:: - Bloodsabers
			quest::faction(341, 15);		#:: + Priests of Life
			quest::faction(262, 15);		#:: + Guards of Qeynos
			#:: Grant a small amount of experience
			quest::exp(500);
			#:: Create a hash for storing cash - 1200 to 1400cp
			my %cash = plugin::RandomCash(1200,1400);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		#:: Match if faction is Indifferent or worse
		elsif ($faction > 4) {
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
			#:: Return two 12101 - Spectacle
			quest::summonitem(12101);
			quest::summonitem(12101);
		}
	}
	#:: Match one 12101 - Spectacle
	elsif (plugin::takeItems(12101 => 1)) {
		quest::say("The bounty will not be paid until two spectacles are received.");
		#:: Return one 12101 - Spectacle
		quest::summonitem(12101);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
