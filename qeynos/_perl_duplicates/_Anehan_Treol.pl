sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Ah.. Hello there..  $name, was it?  Yes, right, $name.  Anyhow, my name's Anehan Treol, member of the League of Antonican Bards.  Feel free to visit our humble guild house here in South Qeynos.  It's called the Wind Spirit's Song and we often put on free shows there.  I think you'd enjoy it.  Anyway, nice chatting with you, and I hope to see you again soon.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18021 - Jusean's Report Request
	if (plugin::takeItems(18021 => 1)) {
		quest::say("Oh, report time already again? Yeah, here ya go, $name. Be careful around here at night, I've been seeing some rough looking characters lurking about.");
		#:: Ding!
		quest::ding();
		#:: Give a 18022 - Anehan's Report
		quest::summonitem(18022);
		#:: Set factions
		quest::faction(284, 10);	#:: + League of Antonican Bards
		quest::faction(281, 1);		#:: + Knights of Truth
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(304, -1);	#:: - Ring of Scale
		quest::faction(285, -1);	#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(250);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
