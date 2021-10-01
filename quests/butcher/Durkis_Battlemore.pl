sub EVENT_ITEM {
	#:: Match a 8910 - A Note to Battlemore
	if (plugin::takeItems(18770 => 1)) {
		quest::say("What have ye got there, lad? Ack. I thought I would never hear from that crazy old man again. He wants me to give you a pair o' me gauntlets. I suppose I kin do that. Here you are, Southern. Wear them in good health");
		#:: Give item 8909 - Gem Inlaid Gauntlets
		quest::summonitem(8909);
		#:: Ding!
		quest::ding();
		#:: Grant a large amount of experience
		quest::exp(16000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
