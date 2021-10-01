sub EVENT_SPAWN {
	#:: Create a timer "stop" that loops every 5 seconds
	quest::settimer("stop",5);
}

sub EVENT_TIMER {
	#:: Match timer "stop"
	if ($timer eq "stop") {
		#:: Send a signal "2" to South Qeynos >> Bassanio_Weekin (1095) with no delay
		quest::signalwith(1095,2,0);
		#:: Send a signal "2" to South Qeynos >> Gahna_Salbeen (1120) with no delay
		quest::signalwith(1120,2,0);
		#:: Send a signal "2" to South Qeynos >> Barthal (1115) with no delay
		quest::signalwith(1115,2,0);
		#:: Send a signal "2" to South Qeynos >> Moran_Smith (1078) with no delay
		quest::signalwith(1078,2,0);
		#:: Send a signal "2" to South Qeynos >> Solani_Dayadil (1094) with no delay
		quest::signalwith(1094,2,0);
		#:: Stop the timer "stop"
		quest::stoptimer("stop");
	}
}
