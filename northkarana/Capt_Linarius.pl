sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		#:: Create a scalar variable to store a random number
		my $RandomNumber = quest::ChooseRandom(1, 2);
		if ($RandomNumber == 1) {
			my $cur_target = $npc->GetHateTop();
			if($cur_target) {
			my $target_name = $cur_target->GetCleanName();
			quest::say("Time to die $target_name!");
			}
		}
		else {
			quest::say("Heathen! Unbeliever! Norrath must be cleansed!");
		}
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, traveler! You are free to rest within this keep or within any of my towers along the roads to Qeynos. My guards shall keep watch over you. While you tread upon the roads, be warned that there are [local dangers] as well as rumors of [corrupt guards].");
	}
	elsif ($text=~/local dangers/i) {
	    	quest::say("My guards report daily to me of dangers in the plains. Lately, they've been telling me of rumors of [Lord Grimrot].");
	}
    	elsif ($text=~/corrupt guards/i) {
		#:: Match if faction is Dubious or better
		if ($faction <= 7) {
	    		quest::say("I have heard rumors of dissension among my guards. I will reward any fine resident for the death of these traitorous guards. If you find you must kill one, bring his guard bracelet back to me. I cannot allow such men among my guards. Be sure they are corrupt, or I shall have your head as well.");
		}
		#:: Missing response
	}
    	elsif ($text=~/lord grimrot/i) {
	    	quest::say("My guards have heard rumors of this Lord Grimrot. It is said that he is a powerful shadowknight who is raising an army of undead. Such things should be reported to the Temple of Life. Journey to Qeynos and speak with Camlend Serbold. Tell him of Lord Grimrot.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13303 - Guard Bracelet
	if (plugin::takeItems(13303 => 1)) {
		#:: Match if faction is Dubious or better
		if ($faction <= 7) {
			quest::say("What a pity. Such a promising soldier. I thank you for ridding us of this corruption and offer you this as a reward. It is nothing more than junk which littered the roadways of the Plains of Karana. I hope you can find a use for it.");
			#:: Give a random reward: 5369 - Bunker Battle Blade or a 9002 - Round Shield, Bronze short sword, Bronze Long Sword, Bronze Battle Axe, Bronze Bastard Sword, Fine Steel Short Sword, Fine Steel Long Sword, Fine Steel Scimitar
			quest::summonitem(quest::ChooseRandom(5369,9002,5026,5027,5028,5029,5350,5352,5353));
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(262, 10);		#:: + Guards of Qeynos
			quest::faction(219, 1);			#:: + Antonius Bayle
			quest::faction(230, -1);		#:: - Corrupt Qeynos Guards
			quest::faction(223, -2);		#:: - Circle Of Unseen Hands
			quest::faction(291, 1);			#:: + Merchants of Qeynos
			#:: Grant a moderate amount of experience
			quest::exp(40000);
			#:: Create a hash for storing cash - 800 to 850cp
			my %cash = plugin::RandomCash(800,850);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			quest::say("I have no need of this");
			#:: Return Guard Bracelet 13303
			quest::summonitem(13303);
		}
	}
	#:: Match a 13304 - Guard Bracelet
	elsif (plugin::takeItems(13304 => 1)) {
		quest::say("You fool!! You have killed a fine and outstanding guard. You shall pay dearly for this!!");
		#:: Attack the player who triggered the event
		quest::attack($name);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My comrades will avenge my death.");
}
