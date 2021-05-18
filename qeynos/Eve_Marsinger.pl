sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail].");
	}
	elsif ($text=~/interested/i) {
		quest::say("I have messages that need to go to - well, right now I have one that needs to go to Highpass. Will you [deliver] mail to Highpass for me?");
	}
	elsif ($text=~/mail/i) {
		quest::say("The League of Antonican Bards has a courier system made up of travelers, adventurers and [agents]. We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices. Are you [interested]?");
	}
	elsif ($text=~/deliver/i) {
		quest::say("Take this pouch to Lislia Goldtune in Highpass. You can find her at the entrance to HighKeep. I am sure she will compensate you for your troubles.");
		#:: Give a 18152 - Pouch of Mail (Highpass)
		quest::summonitem(18152);
	}
	elsif ($text=~/agents/i) {
		quest::say("Sivina Lutewhisper, Marton Stringsinger, Ticar Lorestring and Mistrana Two-Notes all report to my husband, Tralyn.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18165 - Pouch of Mail (Qeynos)
	if (plugin::takeItems(18165 => 1)) {
		quest::say("Incoming mail - very good! Please take this gold for your troubles.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 5);			#:: + League of Antonican Bards
		quest::faction(281, 1);			#:: + Knights of Truth
		quest::faction(262, 1);			#:: + Guards of Qeynos
		quest::faction(304, -1);		#:: - Ring of Scale
		quest::faction(285, -1);		#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(150);
		#:: Create a hash for storing cash - 600 to 1600cp
		my %cash = plugin::RandomCash(600,1600);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
