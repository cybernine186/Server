sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I am Mrysila. custodian of the [Concordance of Research].");
	}
	elsif ($text=~/concordance of research/i) {
		quest::say("The 'Concordance of Research' is an aid to those who follow the path of academia. It, and its sister books, 'Runes and Research,' volumes I and II, help those who are [interested] in researching spells.");
	}
	elsif ($text=~/interested/i) {
			quest::say("I have several copies of each book. If you want a copy of 'Runes and Research', volume I or II, bring me a lightstone and I will give you whichever book I have more of at the moment. Bring me a greater lightstone, and I will give you a copy of the 'Concordance of Research.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10300 - Lightstone
	if (plugin::takeItems(10300 => 1)) {
		quest::say("A lightstone? Thank you very much. Here is a copy of 'Runes and Research' for you.");
		#:: Give a random reward: 18175 - Runes and Research Volume I, or 18176 - Runes and Research Volume II
		quest::summonitem(quest::ChooseRandom(18175, 18176));
		#:: Ding!
		quest::ding();
		#:: Grant a large amount of experience
		$client->AddLevelBasedExp(5, 15);
	}
	#:: Match a 10400 - Greater Lightstone
	elsif (plugin::takeItems(10400 => 1)) {
		quest::say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
		#:: Give a 17504 - Concordance of Research
		quest::summonitem(17504);
		#:: Ding!
		quest::ding();
		#:: Grant a large amount of experience
		$client->AddLevelBasedExp(10, 15);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
