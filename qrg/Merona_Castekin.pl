sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Oh, hello! Welcome to Surefall Glade. Are you planning a trip to Qeynos? If you are, I could use some help finding my [brother].");
	}
	elsif ($text=~/brother/i) {
		quest::say("My brother Ronn went to Qeynos several days ago for supplies. He was just going to Sneed's and back. But he hasn't been seen since. I can't leave the Glade because the Sabertooths could attack at any minute. Could you please find out what happened to my brother? Ask Sneed about [Ronn Castekin].");
	}
}

sub EVENT_ITEM {
	#:: Match a 18014 - Torn Parchment
	if (plugin::takeItems(18014 => 1)) {
		quest::say("Oh Tunare why!?!? Those foul Bloodsabers will pay for my brother's death!! Here. You have given us valuable information about a new threat to our homes. Take this as token of our appreciation.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(302, 5);		#:: + Protectors of Pine
		quest::faction(272, 1);		#:: + Jaggedpine Treefolk
		quest::faction(306, -1);	#:: - Sabertooths of Blackburrow
		quest::faction(262, 1);		#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Give a random reward: 13184 - Band of Tunare, 8011 - Hunting Bow, 13004 - Large Lantern, 13015 - Loaf of Bread, 13185 - Ring of Pine, 13081 - Summoned: Bandages, 13006 - Water Flask
		quest::summonitem(quest::ChooseRandom(13184, 8011, 13004, 13015, 13185, 13081, 13006));
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
