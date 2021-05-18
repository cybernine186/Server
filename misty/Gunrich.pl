sub EVENT_SAY {
	#:: Match if faction is Kindly or better
	if ($faction <= 3) {
		if ($text=~/hail/i) {
			quest::say("Hello, $name. What can I do for you?");
		}
		if ($text=~/dark rivers flow east/i) {
			quest::say("So, Rueppy Kutpurse must have sent you. Here, take this case. Be careful, though. You don't want to get caught with that in town. It is illegal to possess such alcohol.");
			#:: Give a 13131 - Case of Blackburrow Stout
			quest::summonitem(13131);
		}
	}
	else {
		quest::say("I am sorry, $name. You aren't trustworthy enough yet.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
