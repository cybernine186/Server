sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("What?  What?!!  Are we a [young steel warrior]..  Or another [spectator] for the Arena?");
	}
	elsif ($text=~/young steel warrior/i) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		}
		else {
			quest::say("I say!! Good show!! I see the look of the warrior in you. Some day you may be as great as Brin Stolunger. Ha!! Still, you are surely wet behind the ears. You will need to polish your skills. Take this sack. Return it to me when you have filled it with 5 bat wings and 5 snake scales. Be sure you combine the contents of the bag before you give it back to me. Now, be off!!");
			#:: Give a 17935 - Empty Arena Sack
			quest::summonitem(17935);
		}
	}
	elsif ($text=~/spectator/i) {
		quest::say("As I thought!!  You shall be better off upon the ramparts of the arena.  It would be dreadful to see a fine citizen injured in the arena.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13399 - Full Arena Sack
	if (plugin::takeItems(13399 => 1)) {
		#:: Match if faction is Indifferent or worse
		if ($faction > 4) {
			quest::say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
			#:: Return a 13399 - Full Arena Sack
			quest::summonitem(13399);
		}
		else {
			quest::say("Jolly good!! You are clearly on your way to being a fine addition to the Steel Warriors. Now you must take this message to the person noted. All shall be explained.");
			#:: Give a 18893 - Sealed Letter
			quest::summonitem(18893);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(311, 10);		#:: + Steel Warriors
			quest::faction(262, 2);			#:: + Guards of Qeynos
			quest::faction(230, -1);		#:: - Corrupt Qeynos Guards
			quest::faction(330, -1);		#:: - The Freeport Militia
			quest::faction(281, 2);			#:: + Knights of Truth
			#:: Grant a large amount of experience
			quest::exp(6000);
		}
	}
	#:: Match a 18895 - Letter of Recommendation
	elsif (plugin::takeItems(18895 => 1)) {
		quest::say("So I see you have performed the test of undead. Good show. Now it is time you truly tested your mettle. Take this note to Grahan Rothkar. He can be found beneath the arena in the pens. May you live to join our brotherhood.");
		#:: Give a 18894 - Sealed Letter
		quest::summonitem(18894);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(311, 10);		#:: + Steel Warriors
		quest::faction(262, 2);			#:: + Guards of Qeynos
		quest::faction(230, -1);		#:: - Corrupt Qeynos Guards
		quest::faction(330, -1);		#:: - The Freeport Militia
		quest::faction(281, 2);			#:: + Knights of Truth
		#:: Grant a large amount of experience
		quest::exp(6000);
		#:: Create a hash for storing cash - 5 to 20cp
		my %cash = plugin::RandomCash(5,20);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
