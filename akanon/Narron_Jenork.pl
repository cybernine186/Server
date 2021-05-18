sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Come to train? You really should. The way of the warrior is all but abandoned within our grand city. We must build an army of warriors. We may need them should anything happen to all the clockworks. Thank the Underfoot we have the [Watchmen].");
	}
	elsif ($text=~/watchmen/i) {
		quest::say("The Watchmen are the elite of the Gemchoppers. It is not my duty to oversee their operations, but I can command them when in the name of Ak'Anon. I have done so with Watchman [Dexlin].");
	}
	elsif ($text=~/dexlin/i) {
		quest::say("Oh my!! I sent Watchman Dexlin towards the great Human city of Qeynos on the continent of Antonica. He was on a secret mission, but I have yet to hear word of his progress. Manik shall be quite upset if anything happened to one of his Watchmen. Should you find yourself near Qeynos and happen upon Watchman Dexlin, aid him in any way you can.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12378 - Box of Undead Brownie Bones
	if (plugin::takeItems(12378 => 1)) {
		quest::say("Wonderful!! Watchman Dexlin sent word that you would be returning these specimens. I shall see that the Eldritch Collective gets them. For you there is a reward. Manik has donated a pair of Watchman boots!!");
		#:: Give a 12379 - Watchman Boots
		quest::summonitem(12379);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 20);		#:: + Gem Choppers
		quest::faction(288, 5);			#:: + Merchants of Ak`Anon
		quest::faction(333, 5);			#:: + King Ak`Anon
		quest::faction(238, -5);		#:: - Dark Reflection
		quest::faction(1604, -1);		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 4800 to 5200cp
		my %cash = plugin::RandomCash(4800,5200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
