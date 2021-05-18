sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello, have you seen my daughter?");
	}
	elsif ($text=~/daughter/i) {
		quest::say("Yes, my daughter. She went to play near the aqueducts with her doll and now she is gone. If only there was some sign of her..");
	}
}

sub EVENT_ITEM {
	#:: Match a 13712 - Doll
	if (plugin::takeItems(13712 => 1)) {
		quest::emote("tries to keep her composure. She hands you a silver locket with great effort, and then bursts into tears.");
		#:: Give a 1316 - Velvet Choker
		quest::summonitem(1316);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 2);			#:: + Guards of Qeynos
		quest::faction(219, 1);			#:: + Antonius Bayle
		quest::faction(230, -1);		#:: - Corrupt Qeynos Guards
		quest::faction(223, -1);		#:: - Circle Of Unseen Hands
		quest::faction(291, 1);			#:: + Merchants of Qeynos
		#:: Grant a large amount of experience
		quest::exp(27440);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My comrades will avenge my death.");
}
