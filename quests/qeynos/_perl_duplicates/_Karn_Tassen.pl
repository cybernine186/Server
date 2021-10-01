sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Bah, I told Voleen it would happen and it finally did! Food is becoming so scarce that I'm starting to run out of stock. You wouldn't happen to [be a baker] yourself or maybe you know someone who bakes?");
	}
	elsif ($text=~/baker/i) {
		quest::say("Well good! Maybe you can help me restock. If you are a baker you could help me out by restocking my [muffin supply]. Or if you don't mind a little travel, you can pick up a [shipment of bread] for me.");
	}
	elsif ($text=~/shipment of bread/i) {
		quest::say("There is a guy that lives in the plains to the south. I guess the plague hasn't hit that area too bad. Anyway, he's one heck of a baker and makes some quality bread. Go look him up and tell him you want a bag of bread loaves. He's one of those fellas that goes by the name of Meadowgreen.");
	}
	elsif ($text=~/muffin supply/i) {
		quest::say("Thanks, you're a pal. Take this crate and fill it with muffins, then seal it up and bring the Full Muffin Crate back to me. Don't go trying to pass off that store bought stuff on me either, I need fresh baked muffins. The ones in the stores are already too old and will get moldy too fast, so I don't want those.");
		#:: Give a 17881 - Muffin Crate
		quest::summonitem(17881);
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from South Qeynos >> Danaria_Hollin (1066)
	if ($signal == 1) {
		quest::say("Ooh yeah! So would I, honey.");
		#:: Send a signal "1" to South Qeynos >> Danaria_Hollin (1066) with no delay
		quest::signalwith(1066, 1, 0);
	}
}

sub EVENT_ITEM {
	#:: Match a 1838 - Bag of Bread Loaves
	if (plugin::takeItems(1838 => 1)) {
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
		#:: South Qeynos >> Karn_Tassen (1110), restock 13015 - Loaf of Bread, quantity 20
		quest::MerchantSetItem(1110, 13015, 20);
	}
	#:: Match a 1839 - Full Muffin Crate
	elsif (plugin::takeItems(1839 => 1)) {
		quest::say("Hey, thanks kid! You are one top notch baker! Here's some coin for your trouble.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(291, 2);			#:: + Merchants of Qeynos
		quest::faction(223, -1);		#:: - Circle of Unseen Hands
		quest::faction(219, 1);			#:: + Antonius Bayle
		quest::faction(229, 1);			#:: + Coalition of Tradefolk
		quest::faction(262, 1);			#:: + Guards of Qeynos
		#:: Grant a small amount of experience, based on level
		$client->AddLevelBasedExp(2, 14);
		#:: Create a hash for storing cash - 500 to 750cp
		my %cash = plugin::RandomCash(1000,1500);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: South Qeynos >> Karn_Tassen (1110), restock 13014 - Muffin, quantity 20
		quest::MerchantSetItem(1110, 13014, 20);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
