sub EVENT_SPAWN {
	#:: Create a timer "depop" that loops every 3600 seconds (1 hour)
	quest::settimer("depop",3600);
}

sub EVENT_TIMER {
	#:: Match timer "depop"
	if ($timer eq "depop") {
		#:: Stop the timer from looping
		quest::stoptimer("depop");
		#:: Depop
		quest::depop();
	}
}
