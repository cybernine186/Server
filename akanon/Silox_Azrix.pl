sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("gives you a crooked smile. 'Hello there, $name. I'm doin some important 'meditations' to my god here. Maybe you can go somewhere else?'");
	}
}
sub EVENT_ITEM {
	if ($itemcount{20694} == 1) {
		quest::emote(" eye light up. Finally, I can now be cleansed of the dark god within. Thank you $name. Here, take this as a token of my heart felt Thanks");
		quest::summonitem(20697);
		quest::depop_withtimer();
	} else {
		quest::emote("will not take this item.");
		plugin::return_items(\%itemcount);
	}
}