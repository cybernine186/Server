sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Good to meet you. $name.  Please look around.  I have much to offer.  I am a master woodworker.  It runs in the Parsini family.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18833 - Sealed Letter
	if (plugin::takeItems(18833 => 1)) {
		quest::say("I have been waiting for someone to come and retrieve this staff.  Here you are.  You will have to combine it with treant resin and an Odus pearl.  You can find Odus pearls in the water in the harbor. As for the resin, I can make it if you can find me some treant shards.  Maybe another woodworker or cobbler in Qeynos has some.");
		#:: Give a 17917 - Peacekeeper Staff (container version)
		quest::summonitem(17917);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(289, 5);		#:: + Merchants of Erudin
		quest::faction(266, 3);		#:: + High Council of Erudin
		quest::faction(267, 3);		#:: + High Guard of Erudin
		#:: Grant a small amount of experience
		quest::exp(2432);
	}
	#:: Match a 13824 - Wooden Shards
	if (plugin::takeItems(13824 => 1)) {
		quest::say("Wonderful work!! These shards will work nicely. Here you are then. I found a few flasks of treant resin in the back. You can have one. Thanks again. It kept me from having to go out and hunt treants.");
		#:: Give a 13822 - Treant Resin
		quest::summonitem(13822);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(289, 5);		#:: + Merchants of Erudin
		quest::faction(266, 3);		#:: + High Council of Erudin
		quest::faction(267, 3);		#:: + High Guard of Erudin
		#:: Grant a small amount of experience
		quest::exp(2432);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
