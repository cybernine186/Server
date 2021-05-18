#:: Create a scalar variable to store an item count
my $ItemCount;

sub EVENT_SPAWN {
	#:: Reset item count on spawn
	$ItemCount = 0;
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Good day! I see they have good stock for the future armies of Qeynos. I, myself, wish to be a soldier one day instead of doing this [job].");
	}
	elsif ($text=~/job/i) {
		quest::say("I am a [messenger] for Antonius Bayle. Not big enough to fight, but light enough to run all the way to the [Jaggedpine] tomorrow morning. I sort of wish I did not have to go. I'd rather be at the Lion's Mane.");
	}
	elsif ($text=~/messenger/i) {
		quest::say("I will be taking a private note to the head druid of the Jaggedpine Treefolk. Matter of fact, I am carrying the note right now. But enough about that, if it were not for the mission tomorrow, I could be doing something at the [Lion's Mane].");
	}
	elsif ($text=~/jaggedpine/i) {
		quest::say("I will be taking a private note to the head druid of the Jaggedpine Treefolk. Matter of fact, I am carrying the note right now. But enough about that, if it were not for the mission tomorrow, I could be doing something at the [Lion's Mane].");
	}
	elsif ($text=~/lion's mane/i) {
		quest::say("Ahh. The Lion's Mane. If I were there, I would be enjoying a stein of Crow's [special brew]. They are expecting their first shipment of the brew. I believe if I had a few or more of those lagers, I would be very ill. I would probably have to have someone else deliver the note for me. Still, I wish I had one of those fine brews.");
	}
	elsif ($text=~/special brew/i) {
		quest::say("Crow's special brew is one of the finest lagers anywhere. It used to be sold only at Crow's bar, but apparently Crow is allowing it into other bars. For a hefty price, too, I assume. This deal is good for decent citizens considering that the other two bars in Qeynos cater to pretty rough crowds.");
	}
}

sub EVENT_ITEM {
	#:: Match four 13799 - Crow's Special Brew
	if (plugin::takeItems(13799 => 4)) {
		quest::say("Oohhh! My head. Stop the pub from spinning. I cannot make it to the Jaggedpine feeling like this. Please take this note to Te'Anara of the Treefolk. Here is a little silver for the favor. Thanks. Ooohhhh...");
		#:: Give a 18807 - Sealed Letter
		quest::summonitem(18807);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 50);		#:: + Guards of Qeynos
		quest::faction(219, 7);			#:: + Antonius Bayle
		quest::faction(230, -7);		#:: - Corrupt Qeynos Guards
		quest::faction(223, -12);		#:: - Circle of Unseen Hands
		quest::faction(291, 5);			#:: + Merchants of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(8000);
		#:: Create a hash for storing cash - 10 to 50cp
		my %cash = plugin::RandomCash(10,50);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Reset item count
		$ItemCount = 0;
	}
	#:: Match three 13799 - Crow's Special Brew
	elsif (plugin::takeItems(13799 => 3)) {
		if ($ItemCount == 0) {
			quest::say("Oh! That's tasty. I guess I could handle a few more.");
			#:: Increment the item count variable
			$ItemCount++;
			$ItemCount++;
			$ItemCount++;
		}
		else {
			quest::say("Oohhh! My head. Stop the pub from spinning. I cannot make it to the Jaggedpine feeling like this. Please take this note to Te'Anara of the Treefolk. Here is a little silver for the favor. Thanks. Ooohhhh...");
			#:: Give a 18807 - Sealed Letter
			quest::summonitem(18807);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(262, 50);		#:: + Guards of Qeynos
			quest::faction(219, 7);			#:: + Antonius Bayle
			quest::faction(230, -7);		#:: - Corrupt Qeynos Guards
			quest::faction(223, -12);		#:: - Circle of Unseen Hands
			quest::faction(291, 5);			#:: + Merchants of Qeynos
			#:: Grant a moderate amount of experience
			quest::exp(8000);
			#:: Create a hash for storing cash - 10 to 50cp
			my %cash = plugin::RandomCash(10,50);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Match two 13799 - Crow's Special Brew
	elsif (plugin::takeItems(13799 => 2)) {
		if ($ItemCount <= 1) {
			quest::say("Oh! That's tasty. I guess I could handle a few more.");
			#:: Increment the item count variable
			$ItemCount++;
			$ItemCount++;
		}
		else {
			quest::say("Oohhh! My head. Stop the pub from spinning. I cannot make it to the Jaggedpine feeling like this. Please take this note to Te'Anara of the Treefolk. Here is a little silver for the favor. Thanks. Ooohhhh...");
			#:: Give a 18807 - Sealed Letter
			quest::summonitem(18807);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(262, 50);		#:: + Guards of Qeynos
			quest::faction(219, 7);			#:: + Antonius Bayle
			quest::faction(230, -7);		#:: - Corrupt Qeynos Guards
			quest::faction(223, -12);		#:: - Circle of Unseen Hands
			quest::faction(291, 5);			#:: + Merchants of Qeynos
			#:: Grant a moderate amount of experience
			quest::exp(8000);
			#:: Create a hash for storing cash - 10 to 50cp
			my %cash = plugin::RandomCash(10,50);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Match one 13799 - Crow's Special Brew
	elsif (plugin::takeItems(13799 => 1)) {
		if ($ItemCount <= 2) {
			quest::say("Oh! That's tasty. I guess I could handle a few more.");
			#:: Increment the item count variable
			$ItemCount++;
		}
		else {
			quest::say("Oohhh! My head. Stop the pub from spinning. I cannot make it to the Jaggedpine feeling like this. Please take this note to Te'Anara of the Treefolk. Here is a little silver for the favor. Thanks. Ooohhhh...");
			#:: Give a 18807 - Sealed Letter
			quest::summonitem(18807);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(262, 50);		#:: + Guards of Qeynos
			quest::faction(219, 7);			#:: + Antonius Bayle
			quest::faction(230, -7);		#:: - Corrupt Qeynos Guards
			quest::faction(223, -12);		#:: - Circle of Unseen Hands
			quest::faction(291, 5);			#:: + Merchants of Qeynos
			#:: Grant a moderate amount of experience
			quest::exp(8000);
			#:: Create a hash for storing cash - 10 to 50cp
			my %cash = plugin::RandomCash(10,50);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
