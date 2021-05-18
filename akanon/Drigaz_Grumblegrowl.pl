sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Grrreetings, $name, would you like to share a roasted rat steak or perhaps a tall glass of gnomish spirits? Have no fear of my appearance. My bark is meaner than my bite! Grraw haw haw!");
	}
}

sub EVENT_ITEM {
	#:: Match a 1779 - Sealed Parchment and a 14585 - Odd Cold Iron Necklace
	if (plugin::takeItems(1779 => 1, 14585 => 1)) {
		quest::say("I had hoped to see the last of these sorrowful symbols. There is little I can tell you of the details of the kobold religion as I was rescued from death as a pup by the Deep Muses and reunited with Brell Serilis. What I know is this, the deity this symbol represents is named Rolfron Zek. He was a devoted shaman of Brell before the Abandonment, now he is the lord of Despair and Hopelessness. There is a shaman of Rolfron that teaches the local kobolds, he carries with him a doctrine. Recover the doctrine and take it with this translation scroll back to your Temple");
		#:: Give a 1780 - Hieroglyph Translations
		quest::summonitem(1780);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(240, 5);		#:: + Deep Muses
		quest::faction(288, 1); 	#:: + Merchants of Ak'Anon
		quest::faction(255, 1);		#:: + Gemchoppers
		quest::faction(238, -1);	#:: - Dark Reflection
		#:: Grant a moderate amount of experience
		quest::exp(1500);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
