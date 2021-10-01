sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Welcome! It is good to see our disciples can still outsmart the guards of Qeynos and make it to the Shrine of Bertoxxulous. Our ranks are best filled with disciples such as yourself. We have need of you. Do you [wish to serve] the Lord of Disease or not?");
	}
	elsif ($text=~/wish to serve/i) {
		quest::say("Aye! That is good. Of late, we have heard news of a message that will be sent to the Treefolk of the Jaggedpine. Antonius Bayle will send word to the Jaggedpine that certain requests will be met. We must intercept this message. That is all you need to know. Go and find Antonius Bayle's messenger, Gharin, He should have the message. Get it by any means necessary and return it to me. Go now!");
	}
}

sub EVENT_ITEM {
	#:: Match a 18807 - Sealed Letter
	if (plugin::takeItems(18807 => 1)) {
		quest::say("Good work, child of the plague.  Now take this forged note to Te'Anara of the Jaggedpine Treefolk.  Be sure to watch your back now.  The guards of Qeynos surely know who you are now.  They will not stop to ask questions.");
		#:: Give a 18806 - Sealed Letter
		quest::summonitem(18806);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(221, 50);		#:: + Bloodsabers
		quest::faction(262, -7);		#:: - Guards of Qeynos
		quest::faction(296, 5);			#:: + Protectors of Pine
		quest::faction(341, -12);		#:: - Priests of Life
		quest::faction(230, 4);			#:: + QRG Protected Animals
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 50 to 100cp
		my %cash = plugin::RandomCash(0,100);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
