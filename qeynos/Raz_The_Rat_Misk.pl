sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Spare 3 gold so I can get a decent meal for once, master?");
	}
	elsif ($text=~/favor/i) {
		quest::say("I found this pouch and do not know whose it is. I would be more than willing to part with it for 5 gold, since the owner would probably reward you more.");
	}
}

sub EVENT_ITEM {
	#:: Match five gold
	if (plugin::takeCoin(0, 0, 5, 0)) {
		quest::say("Very good, master! Best of luck in locating the proper owner. Maybe try giving it to ol' Crow in North Qeynos. Everyone knows if you need to fence.. er.. find something in Qeynos, Crow is your man. He always seems to know who's missing what. I am off to get some food.");
		#:: Give a 17600 - Tattered Leather Pouch
		quest::summonitem(17600);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(223, 2);		#:: + Circle of Unseen Hands
		quest::faction(291, -1);	#:: - Merchants of Qeynos
		quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
		quest::faction(262, -1);	#:: + Guards of Qeynos
		quest::faction(273, 1);		#:: + Kane Bayle
		quest::exp(200);
	}
	#:: Match 3 gold
	elsif (plugin::takeCoin(0, 0, 3, 0)) {
		quest::say("Thank you, kind master. I don't wish to trouble you further but I do have another [favor] to ask..");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(223, 1);		#:: + Circle of Unseen Hands
		quest::faction(291, -1);	#:: - Merchants of Qeynos
		quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
		quest::faction(262, -1);	#:: + Guards of Qeynos
		quest::faction(273, 1);		#:: + Kane Bayle
		quest::exp(200);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
