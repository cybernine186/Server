sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello Traveler, I do not see many this deep into the woods.");
	} 
}

sub EVENT_ITEM {
	#:: Match a 20877 - Albino Rattlesnake Eggs
	if (plugin::takeItems(20877 => 1)) {
		quest::say("Wow, this is certainly something I have not seen in a long time. It was said that this species of snake had been wiped out due to the poachers and griffins. It was very noble of you to help in saving this species. I will see that these are raised properly. Please wear this icon with pride so other rangers will know of the good deed you have done.");
		#:: Give a 20878 - Symbol of Achievement
		quest::summonitem(20878);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(269, 10); 		#:: + Kithicor Residents
		quest::faction(302, 1); 		#:: + Protectors of Pine
		quest::faction(272, 1); 		#:: + Jaggedpine Treefolk
		quest::faction(324, -1); 		#:: - Unkempt Druids
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
