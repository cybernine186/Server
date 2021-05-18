sub EVENT_SPAWN {
	quest::settimer("depop", 3600);
}

sub EVENT_TIMER {
	quest::stoptimer("depop");
	quest::depop();
}
