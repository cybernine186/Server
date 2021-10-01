sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello $name.  Are you a [good] $race or a [bad] $race?");
	}
	elsif ($text=~/good/i) {
		quest::say("Only St. Nicholas can say for sure.  Did he give you any presents?");
	}
	elsif ($text=~/bad/i) {
		quest::say("Then prepare yourself for my rod, $class!");
		quest::attack($name);
	}
	elsif ($text=~/presents|yes/i) {
		quest::say("I will take your Orange Ribbon boxes--in exhange for one, you get a [small gift]; in exchange for four, you get a [Gift-Wrapped Toy].");
	}
	elsif ($text=~/\bsmall gift\b/i) {
		quest::say("I have some delicious Frostfell Goblin Snacks for you in exchange for your Orange Ribbon gift boxes.");
	}
	elsif ($text=~/gift-wrapped toy/i) {
		quest::say("Oh, those are for the really nice boys and girls.");
	}
}

sub EVENT_ITEM {
	if (plugin::takeItems(32567 => 4)) {
		quest::summonitem(88364);
	}
	elsif (plugin::takeItems(32567 => 1)) {
		quest::summonitem(87559);
	}
	elsif (plugin::takeItems(88364 => 1)) {
		quest::say("Here you are then, $name.  If you would like something different, I do gift exchange.");
		quest::summonitem(quest::ChooseRandom(11175, 85579, 17403));
	}
	elsif (plugin::takeItems(11175 => 1)) {
		quest::say("Here you are then, $name.  If you would like something different, I do gift exchange.");
		quest::summonitem(quest::ChooseRandom(85579, 17403));
	}
	elsif (plugin::takeItems(85579 => 1)) {
		quest::say("Here you are then, $name.  If you would like something different, I do gift exchange.");
		quest::summonitem(quest::ChooseRandom(11175, 17403));
	}
	elsif (plugin::takeItems(17403 => 1)) {
		quest::say("Here you are then, $name.  If you would like something different, I do gift exchange.");
		quest::summonitem(quest::ChooseRandom(11175, 85579));
	}
}
