sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. Thank you for stopping by. Had you heard I was looking for any and all information regarding the Tesch Val incursion? Perhaps you have come to help me gather knowledge? I seek the [Tesch Val scrolls]!");
	}
	elsif ($text=~/tesch val scrolls/i) {
		quest::say("Oh good! I can add them to my collection. We are preparing to make books you know. Bring me any of the scrolls you find in the old Splitpaw lair, and I would be happy to reward you handsomely.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18504 - Tanned Splitpaw Skin, 18505 - Tanned Split Paw Skin, 18506 - Tanned Split Paw Skin, 18507 - Tanned Split Paw Skin
	if (plugin::takeItems(18504 => 1, 18505 => 1, 18506 => 1, 18507 => 1)) {
		quest::say("Why thank you, $name. If you do happen to come across any more of these, please bring them to me.");
		#:: "Sometimes" give a 12076 - Karana's Tear
		#:: Create a scalar variable to store a random number 1-5
		my $randomChance = quest::ChooseRandom(1,2,3,4,5);
		#:: Match if greater than 4 (20 percent chance)
		if ($randomChance > 2) {
			#:: Give a 12076 - Karana's Tear
			quest::summonitem(12076);
		}
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(121, 10);		#:: + Qeynos Citizens
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 4000 to 15000cp
		my %cash = plugin::RandomCash(4000,15000);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 18504 - Tanned Splitpaw Skin or a 18505 - Tanned Split Paw Skin or a 18506 - Tanned Split Paw Skin or a 18507 - Tanned Split Paw Skin
	elsif (plugin::takeItems(18504 => 1) || plugin::takeItems(18505 => 1) || plugin::takeItems(18506 => 1) || plugin::takeItems(18507 => 1)) {
		quest::say("Why thank you, $name. If you do happen to come across any more of these, please bring them to me.");
		#:: "Sometimes" give a 12076 - Karana's Tear
		#:: Create a scalar variable to store a random number 1-10
		my $randomChance = quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10);
		#:: Match if greater than 9 (10 percent chance)
		if ($randomChance > 9) {
			#:: Give a 12076 - Karana's Tear
			quest::summonitem(12076);
		}
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(121, 2);			#:: + Qeynos Citizens
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 950 to 3500cp
		my %cash = plugin::RandomCash(950,3500);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
