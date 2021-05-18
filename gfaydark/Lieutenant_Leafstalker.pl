sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail!! Respect all laws in Kelethin and her territory and you shall live a fruitful life.");
	}
	elsif ($text=~/quiver of kithicor/i) {
		quest::say("Ummm.. I have some bad news. I did find it, but a band of brownie outcasts came in the night, took [all of the arrows] from the quiver and ran back to the forest they came from. As if that were not enough, while I was hot on their little heels, the thief [Wiltin Windwalker] came into Kelethin and took the quiver itself. Whew!! What a day!");
	}
	elsif ($text=~/arrows/i) {
		quest::say("All of the arrows are gone. You must get the arrows of recognition, acknowledgment, defiance, gallantry, bravery and fortitude. Get them from the brownie outcasts and combine them in the quiver.");
	}
	elsif ($text=~/wiltin windwalker/i) {
		quest::say("Wiltin Windwalker!! Traitor he is! He left Kelethin to join the Pirates of Gunthak. I heard news that the Royal Navy of Ak'Anon sank the pirate ship he was on in the Ocean of Tears. What I don't get is where those little gnomes moor their ships. They have no harbor!! But that is another story.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
