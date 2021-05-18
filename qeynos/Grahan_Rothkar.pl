sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name! What business do you have in the pens of the Qeynos Arena? Have you a report of the [escaped catman]?");
	}
	elsif ($text=~/escaped catman/i) {
		quest::say("We had a catman imprisoned here for use in future gladiator battles. He escaped. In the process, he bit off my assistant's hand which held the key to pen number seven. I now seek to hire a warrior to [retrieve key seven].");
	}
	elsif ($text=~/retrieve key seven/i) {
		quest::say("Hmmm. You seem a bit young, but I shall give you a chance. Seek out the catman named Nomala. He most likely returned to [Kerra Isle]. He is not very powerful, but his people are surely watching over him. Retrieve the key for me and be rewarded.");
	}
	elsif ($text=~/kerra isle/i) {
		quest::say("Kerra Isle is a dangerous place. The Kerra are not a friendly race. There is an island between Erudin and Qeynos which is inhabited by a more docile tribe of Kerra. I hear they took some of their Kerra beetles along with them to the island, too.");
	}
	elsif ($text=~/second escaped gladiator/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-escaped-prisoners";
		if (quest::get_data($key)) {
			quest::say("It appears our prize gladiator has escaped. He is a minotaur hero!! Trained by our best. He took down five of our greatest warriors during his escape. Rumor has it he fled to his homeland in the Steamfont Mountains. They say he is an outcast and does not live with his people. He appears during times of great need to champion the minotaurs. Return his shackles to me and glory is yours!!");
		}
		else {
			quest::say("Have you a report of the [escaped catman]?");
		}
	}
}

sub EVENT_TIMER {
	#:: Match a timer "depop"
	if ($timer eq "depop") {
		quest::stoptimer("depop");
		#:: Send a signal "1" to South Qeynos >> a_young_lion (1303) with no delay
		quest::signalwith(1303, 1, 0);
	}
}

sub EVENT_ITEM {
	#:: Match a 20031 - Pen Key # 7
	if (plugin::takeItems(20031 => 1)) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
			#:: Return a 20031 - Pen Key # 7
			quest::summonitem(20031);
		}
		else {
			quest::say("I thank you. I must admit I had my doubts, but you have proven yourself a true warrior. I salute you. You can be of some assistance to me. It see ms as though there has been a [second escaped gladiator] and I have a reward waiting for a human warrior.");
			#:: Give a 5033 - Bronze Broad Sword
			quest::summonitem(5033);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(311, 10);	#:: + Steel Warriors
			quest::faction(262, 2);		#:: + Guards of Qeynos
			quest::faction(230, -1);	#:: - Corrupt Qeynos Guards
			quest::faction(330, -1);	#:: - The Freeport Militia
			quest::faction(281, 2);		#:: + Knights of Truth
			#:: Grant a large amount of experience
			quest::exp(10000);
			#:: Create a hash for storing cash - 100 to 150cp
			my %cash = plugin::RandomCash(100,150);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Data bucket to verify quest has been started appropriately
			$key = $client->CharacterID() . "-escaped-prisoners";
			#:: Set a data bucket, quest started
			quest::set_data($key, 1);
		}
	}
	#:: Match 12188 - Minotaur Hero Shackles
	elsif (plugin::takeItems(12188 => 1)) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-escaped-prisoners";
		if (quest::get_data($key)) {
			quest::say("You are a true Steel Warrior!! Now you shall wear my hero bracers. I designed them for my greatest gladiators and you have shown yourself mighty enough to wear them.");
			#:: Give a 12189 - Hero Bracers
			quest::summonitem(12189);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(311, 10);	#:: + Steel Warriors
			quest::faction(262, 2);		#:: + Guards of Qeynos
			quest::faction(230, -1);	#:: - Corrupt Qeynos Guards
			quest::faction(330, -1);	#:: - The Freeport Militia
			quest::faction(281, 2);		#:: + Knights of Truth
			#:: Grant a large amount of experience
			quest::exp(10000);
			#:: Create a hash for storing cash - 1000 to 2000cp
			my %cash = plugin::RandomCash(1000,2000);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Delete the data bucket
			$key = $client->CharacterID() . "-escaped-prisoners";
			quest::delete_data($key);
		}
		else {
			quest::say("Have you a report of the [escaped catman]?");
			#:: Return a 12188 - Minotaur Hero Shackles
			quest::summonitem(12188);
		}
	}
	#:: Match a 18894 - Sealed Letter
	elsif (plugin::takeItems(18894 => 1)) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
			#:: Return a 18894 - Sealed Letter
			quest::summonitem(18894);
		}
		else {
			quest::say("So you are ready to encounter your final test. I wish you well, young warrior. Take this key to the pen on the left along the wall with three doors. There you shall meet your final challenge. Return with proof of victory. Exit before it is at an end and I shall not help you.");
			#:: Give a 20029 - Pen Key # 5
			quest::summonitem(20029);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(311, 5);	#:: + Steel Warriors
			quest::faction(262, 1);		#:: + Guards of Qeynos
			quest::faction(230, -1);	#:: - Corrupt Qeynos Guards
			quest::faction(330, -1);	#:: - The Freeport Militia
			quest::faction(281, 1);		#:: + Knights of Truth
			#:: Grant a large amount of experience
			quest::exp(2000);
			#:: Spawn one and only one South Qeynos >> a_young_lion (1303)
			quest::unique_spawn(1303, 0, 0, -442, -167, -24.87, 7);
			#:: Create a timer to loop every 600 seconds (10 minutes)
			quest::settimer("depop",600);
			#:: Data bucket to verify quest has been started appropriately
			$key = $client->CharacterID() . "-steel-warriors-final-test";
			#:: Set a data bucket, quest started
			quest::set_data($key, 1);
		}
	}
	#:: Match a 13398 - Arena Lion Skin
	elsif (plugin::takeItems(13398 => 1)) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-steel-warriors-final-test";
		if (quest::get_data($key)) {
			quest::say("I salute you. You have done well and crossed into the brotherhood of the Steel Warriors. Welcome. Take this. It is the mark of a Steel Warrior. Live the way of the warrior."); 
			#:: Give a 13229 - Steel Warrior Bracer
			quest::summonitem(13229);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(311, 25);	#:: + Steel Warriors
			quest::faction(262, 5);		#:: + Guards of Qeynos
			quest::faction(230, -3);	#:: - Corrupt Qeynos Guards
			quest::faction(330, -3);	#:: - The Freeport Militia
			quest::faction(281, 5);		#:: + Knights of Truth
			#:: Grant a large amount of experience
			quest::exp(8000);
			#:: Delete the data bucket
			quest::delete_data($key);
		}
		else {
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
			#:: Return a 13398 - Arena Lion Skin
			quest::summonitem(13398);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
