#:: Create a scalar variable to store an item count
my $ItemCount;

sub EVENT_SPAWN {
	#:: Reset item count on spawn
	$ItemCount = 0;
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Why, hello there!!  What is a powerful adventurer such as yourself doing in a dive like this?  I hope it is buying little ol' me a drink...?");
	}
}

sub EVENT_ITEM {
	#:: Match four 13038 - Ogre Swill
	if (plugin::takeItems(13038 => 4)) {
		quest::say("Mmmm... <Burp!> Thank you. Here is a little dona... <Hic!> dona... <Hic!> mmmoney for your generosity.");
		#:: Give a 13291 - Donation
		quest::summonitem(13291);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(291, 1);		#:: + Merchants of Qeynos
		quest::faction(223, -1);	#:: - Circle Of Unseen Hands
		quest::faction(219, 1);		#:: + Antonius Bayle
		quest::faction(229, 1);		#:: + Coalition of Tradefolk
		quest::faction(262, 1);		#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(200);
		#:: Reset item count
		$ItemCount = 0;
	}
	#:: Match three 13038 - Ogre Swill
	elsif (plugin::takeItems(13038 => 3)) {
		if ($ItemCount == 0) {
			quest::say("Mmmm. Ahh... <Burp!> That was delicious. How about another?");
			#:: Increment the item count variable
			$ItemCount++;
			$ItemCount++;
			$ItemCount++;
		}
		else {
			quest::say("Mmmm... <Burp!> Thank you. Here is a little dona... <Hic!> dona... <Hic!> mmmoney for your generosity.");
			#:: Give a 13291 - Donation
			quest::summonitem(13291);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(291, 1);		#:: + Merchants of Qeynos
			quest::faction(223, -1);	#:: - Circle Of Unseen Hands
			quest::faction(219, 1);		#:: + Antonius Bayle
			quest::faction(229, 1);		#:: + Coalition of Tradefolk
			quest::faction(262, 1);		#:: + Guards of Qeynos
			#:: Grant a small amount of experience
			quest::exp(200);
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Match two 13038 - Ogre Swill
	elsif (plugin::takeItems(13038 => 2)) {
		if ($ItemCount <= 1) {
			quest::say("Mmmm. Ahh... <Burp!> That was delicious. How about another?");
			#:: Increment the item count variable
			$ItemCount++;
			$ItemCount++;
		}
		else {
			quest::say("Mmmm... <Burp!> Thank you. Here is a little dona... <Hic!> dona... <Hic!> mmmoney for your generosity.");
			#:: Give a 13291 - Donation
			quest::summonitem(13291);			
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(291, 1);		#:: + Merchants of Qeynos
			quest::faction(223, -1);	#:: - Circle Of Unseen Hands
			quest::faction(219, 1);		#:: + Antonius Bayle
			quest::faction(229, 1);		#:: + Coalition of Tradefolk
			quest::faction(262, 1);		#:: + Guards of Qeynos
			#:: Grant a small amount of experience
			quest::exp(200);
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Match one 13038 - Ogre Swill
	elsif (plugin::takeItems(13038 => 1)) {
		if ($ItemCount <= 2) {
			quest::say("Mmmm. Ahh... <Burp!> That was delicious. How about another?");
			#:: Increment the item count variable
			$ItemCount++;
		}
		else {
			quest::say("Mmmm... <Burp!> Thank you. Here is a little dona... <Hic!> dona... <Hic!> mmmoney for your generosity.");
			#:: Give a 13291 - Donation
			quest::summonitem(13291);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(291, 1);		#:: + Merchants of Qeynos
			quest::faction(223, -1);	#:: - Circle Of Unseen Hands
			quest::faction(219, 1);		#:: + Antonius Bayle
			quest::faction(229, 1);		#:: + Coalition of Tradefolk
			quest::faction(262, 1);		#:: + Guards of Qeynos
			#:: Grant a small amount of experience
			quest::exp(200);
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
