sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings. stranger. Please excuse my melancholy state.  I have had some [bad news] that has brought me great sorrow.");
	}
	elsif ($text=~/bad news/i) {
		quest::say("My youngest son was devoured by a grizzly bear while playing near the caves. It was an unfortunate accident. The great bear was just protecting its territory. Now, could you please just leave me be? <sniff>");
	}
	elsif ($text=~/toe needs the bayle list/i) {
		quest::say("The Bayle List is gone. It lies inside the belly of that beast, [Mammoth]");
	}
	elsif ($text=~/mammoth/i) {
		quest::say("Mammoth is the great bear which inhabits the caves. It was he that swallowed my son whole. My son was using the scroll case as a play sword when Mammoth approached. I know you need the list but my vows as a Protector of the Pine forbid me to harm the bear. Help me ease my pain. Kill Mammoth and bring me his hide. You will find the list inside the beast.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18809 - Bayle List II and a 13912 - Mammoth's Hide
	if (plugin::takeItems(18809 => 1, 13912 => 1)) {
		quest::say("It is not right to feel satisfied at the sight of Mammoth's hide, but I do. Thank you, $name.");
		#:: Give a 18809 - Bayle List II
		quest::summonitem(18809);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(302, 10);	#:: + Protectors of Pine
		quest::faction(272, 10);	#:: + Jaggedpine Treefolk
		quest::faction(306, -30);	#:: - Sabertooths of Blackburrow
		quest::faction(262, 10);	#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 550 to 650cp
		my %cash = plugin::RandomCash(550,650);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
