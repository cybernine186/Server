sub EVENT_SPAWN {
	#:: Set a timer that loops every 900 seconds (15 min)
	quest::settimer("despawn", 900);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("'Avast, matey! Captain Bones here. This here island is mine! Raise anchor and ship out!");
	}
	elsif ($text=~/come back to the closet/i) {
		quest::emote("lets out a long sigh.");
		quest::say("I wish I could be leaving this isle of the damned, alas, me boat has gone to Prexus' locker. I'll not be leavin' here until I get meself another ship.");
	}
}

sub EVENT_TIMER {
	#:: Match the timer "despawn"
	if ($timer eq "despawn") {
		#:: Stop the timer from looping over and over
		quest::stoptimer("despawn");
		#:: Depop
		quest::depop();
	}
}

sub EVENT_ITEM {
	#:: Match a 12218 - Ship in a Bottle
	if (plugin::takeItems(12218 => 1)) {
		quest::say("Aye, matey! Ye found me another vessel with which to sail the seven seas? Let's be shoving off then! Come on, hop aboard, swabby! Be sure to pick up the minstrel. His hide was last seen by Basher Avisk. Only he be knowin' [where the minstrel ] be");
		#:: Give a 12215 - The Captain
		quest::summonitem(12215);
		#:: Ding!
		quest::ding();
		#:: Stop the timer from looping over and over
		quest::stoptimer("despawn");
		#:: Depop
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
