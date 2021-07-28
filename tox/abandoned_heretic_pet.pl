sub EVENT_ITEM {
	#:: Match a 13894 - Useless Cloth Cap
	if (plugin::takeItems(13894 => 1)) {
		quest::say("Good work, you should be running this operation instead of that Talrigar fellow. Have a small reward. A little bit of the gems I found while tunneling through this rock.");
		#:: Give a random reward: 10015 - Malachite, 10016 - Lapis Lazuli, 10017 - Turquoise, 10018 - Hematite
		quest::summonitem(quest::ChooseRandom(10015, 10016, 10017, 10018));
		#:: Ding!
		quest::exp(3500);
		quest::ding();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from tox/38016.pl (a_skeleton)
	if ($signal == 1) {
		quest::say("Blast you, skeletons! Why I ever resurrected you, I don't know!");
		#:: send a signal '1' to Toxxulia Forest >> a_skeleton (38016) with no delay
		quest::signalwith(38016, 1, 0);
	}
}
