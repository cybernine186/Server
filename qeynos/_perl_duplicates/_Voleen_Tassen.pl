sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hi $name. Times are tough these days. It looks like Karn's fears have come to pass. We are finding ourselves running short on baked goods lately. Would you be [willing to help] us out?");
	}
	elsif ($text=~/willing to help/i) {
		quest::say("You'd help us? Oh, you are such a dear! Well, there are two ways you can help us and our little business. If you [can bake] you can make us some muffins so we don't run out. Otherwise, you [can travel] a little way for us and pick up some bread.");
	}
	elsif ($text=~/can bake/i) {
		quest::say("A free lance baker, well that is nice. Here. Take this crate and make some of your muffins. Bring the Full Muffin Crate back to me when you are done. I'll pay you the same as we pay our regular suppliers. Make sure you bake them fresh yourself, we only sell quality muffins here.");
		#:: Give a 17881 - Muffin Crate
		quest::summonitem(17881);
	}
	elsif ($text=~/can travel/i) {
		#:: Made up
		quest::say("In the plains to the South, you will find a baker named Jarlen Meadowgreen.  Seek him out and ask him for a bag of bread loaves.");
	}
	elsif ($text=~/tax collection/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			quest::say("Oh dear. We had forgotten about those pesky taxes. Here you go, $name. Sorry you had to come collect them. We will try to be on time from now on.");
			#:: Give a 13179 - Tassen's Tax Payment
			quest::summonitem(13179);
			#:: Set faction
			quest::faction(291,-1);		#:: - Merchants of Qeynos
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 1838 - Bag of Bread Loaves
	if (plugin::takeItems(1838 => 1)) {
		#:: Unconfirmed
		quest::say("Ah finally, fresh bread! All right let me get this on the shelves right away. Here is your payment.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(291, 4);			#:: + Merchants of Qeynos
		quest::faction(223, -2);		#:: - Circle of Unseen Hands
		quest::faction(219, 2);			#:: + Antonius Bayle
		quest::faction(229, 2);			#:: + Coalition of Tradefolk
		quest::faction(262, 2);			#:: + Guards of Qeynos
		#:: Grant a small amount of experience, based on level
		$client->AddLevelBasedExp(4, 14);
		#:: Create a hash for storing cash - 1000 to 1500cp
		my %cash = plugin::RandomCash(1000,1500);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: South Qeynos >> Voleen_Tassen (1111), restock 13015 - Loaf of Bread, quantity 20
		quest::MerchantSetItem(1111, 13015, 20);
	}
	#:: Match a 1839 - Full Muffin Crate
	elsif (plugin::takeItems(1839 => 1)) {
		quest::say("Oh my! Smell those muffins, fresh from the oven and ready to serve! They look delicious dear. Here is some money for your trouble.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(291, 2);			#:: + Merchants of Qeynos
		quest::faction(223, -1);		#:: - Circle of Unseen Hands
		quest::faction(219, 1);			#:: + Antonius Bayle
		quest::faction(229, 1);			#:: + Coalition of Tradefolk
		quest::faction(262, 1);			#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 500 to 750cp
		my %cash = plugin::RandomCash(500,750);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: South Qeynos >> Voleen_Tassen (1111), restock 13014 - Muffin, quantity 20
		quest::MerchantSetItem(1111, 13014, 20);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
