sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/Trumpy_Irontoe.pl
	if ($signal == 1) {
		quest::say("Yeah, Yeah. I hope you fall in, you little creep.");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.  Welcome to Fish's Ale.  Have fun but watch your step.  We get a rough crowd in here and I would hate to have to bust your head in if you started trouble.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
