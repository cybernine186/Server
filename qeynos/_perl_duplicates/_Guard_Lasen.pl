sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name! Whew! I sure get parched out here on patrol. Even when it rains I can't help but build up a [thirst] defending the good people of Qeynos.");
	}
	elsif ($text=~/thirst/i) {
		quest::say("Well, I have a bit of a belly sickness so the only thing I can drink is normal water. I can't even keep down the stuff our local magicians summon and call water. If you would bring me a water flask, I would be most grateful.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13006 - Water Flask
	if (plugin::takeItems(13006 => 1)) {
		quest::say("Oh, thank you so much!");
		quest::emote("brings the drink to his lips and ravenously drinks the bottle's entire contents.");
		quest::say("Aaaaah. Here, please take this reward for your kindness. Also take my advice, do not go exploring beneath Qeynos unless you bring friends. I have seen too many like you enter the aqueducts alone, never to return.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(219, 1);		#:: + Antonius Bayle
		quest::faction(230, -1);	#:: - Corrupt Qeynos Guards
		quest::faction(223, -1);	#:: - Circle Of Unseen Hands
		quest::faction(291, 1);		#:: + Merchants of Qeynos
		#:: Grant a small amount of experience
		quest::exp(200);
		#:: Create a hash for storing cash - 1 to 10cp
		my %cash = plugin::RandomCash(1,10);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
