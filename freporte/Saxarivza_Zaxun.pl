sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Salutations, $name! I am here as a favor to my brother, High Priest Perrir. We seek loyal followers of Innoruuk to earn their place among the hierarchy of the Spires. Are you [devoted to Innoruuk]?");
	}
	elsif ($text=~/devoted to Innoruuk/i) {
		quest::say("My brother requests your presence in Neriak at the Spires of Innoruuk. Take this note with you, $name. It will inform Perrir of who sent you.");
		#:: Give item 18148 - Letter of recommendation
		quest::summonitem(18148);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
