sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail!  What do think of [Lisera]?  She ain't much to look at, but soon she will be singing again.");
	}
	elsif ($text=~/lisera/i) {
		quest::say("Lisera is my lute.  She sounds horrible.  I need to get her tuned by a master tuner, but the League's Master Tuner is in the Plains of Karana for a while.  If only..  hey!!  You look like a fellow bard...  You [interested in the job]?");
	}
	elsif ($text=~/interested in the job/i) {
		quest::say("Great!!  Here.  Take Lisera to Vhalen Nostrolo.  He is in the plains near the well, composing.  He must tune it for me.  Be very careful! Lisera is all I've got.  If you complete this task and return with good news. I shall be glad to pass along an extra songsheet for a tune entitled 'Hymn of Restoration.");
		#:: Give a 13114 - Lisera Lute
		quest::summonitem(13114);
	}
}

sub EVENT_ITEM {
	#:: Match a 18803 - Note To Cassius
	if (plugin::takeItems(18803 => 1)) {
		quest::say("Vhalen does such fine work. I can't wait till he comes back to Qeynos.");
		#:: Ding!
		quest::ding();
		#:: Give a 15007 - Song: Hymn of Restoration
		quest::summonitem(15007);
		#:: Set factions
		quest::faction(284, 10);	#:: + League of Antonican Bards
		quest::faction(281, 1);		#:: + Knights of Truth
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(304, -1);	#:: - Ring of Scale
		quest::faction(285, -1);	#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 600 to 900cp
		my %cash = plugin::RandomCash(600,900);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
