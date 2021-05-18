sub EVENT_DEATH_COMPLETE {
	#:: Send a signal '1' to The Plane of Sky >> Key_Master (71056) with no delay
	quest::signalwith(71056, 1, 0);
}
