sub EVENT_SAY {
	if ($text=~/Morin sent me/i) {
		quest::say("Morin Shadowbane, the great ranger, sent you to assist us? A strong ranger you must be if he has sent you personally. There is a great evil stalking the land, and it has spread its tendrils into Kithicor Forest. We believe the [shadowed men] are involved with this, somehow.");
	}
	elsif ($text=~/shadowed men/i) {
		quest::say("The shadowed men have recently begun to appear, with vile purposes unknown to us. Their leader wanders these woods with a contingent of guards. Bring us his code book, and we may learn more of their plans.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20636 - Shadowed Code Book
	if (plugin::takeItems(20636 => 1 )) {
		quest::say("Excellent work, $name! According to these codes, it seems the ghoul boss has been alerted to our probes now that his messenger is missing. We have a scout, Glidara Myllar, who may be in danger. Give her this note as soon as you can, she is in grave danger!");
		#:: Give item 20635 - Warning to Glidara
		quest::summonitem(20635);
		#:: Ding!
		quest::ding();
	}
	#:: Match a 20639 - Orders for Bryn
	elsif (plugin::takeItems(20639 => 1 )) {
		quest::say("The vile ghoul boss has been defeated! My new orders state to arm you with our finest weaponry. Take this, the mighty orc impaler. Safe journeys, brave adventurer.");
		#:: Give item 7330 - Orc Impaler
		quest::summonitem(7330);
		#:: Ding!
		quest::ding();
		#:: Give a moderate amount of xp
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}	
