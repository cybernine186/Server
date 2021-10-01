sub EVENT_ITEM {
	#:: Return unused items
	plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
	#:: Signal from steamfont/Cargo_Clockwork.pl
	quest::say("What a glorious machine the cargo clockwork is!!");
	#:: Send a signal to Steamfont Mountains >> Cargo_Clockwork (56105)
	quest::signal(56105,1);
}
