sub EVENT_SPAWN {
	quest::settimer("depop", 10);
}

sub EVENT_TIMER {
	if($timer eq "depop") {
		quest::depop(1);
		quest::stoptimer("depop");
	}
}