sub EVENT_SPAWN {
	#:: Set running to true
	quest::SetRunning(1);
}

sub EVENT_SIGNAL {
	#:: Match if signal from steamfont/Jogl_Doobraugh.pl is "1"
	if (($signal==1) && (($x == -495) || ($x == -734)) && (($y == -154) || ($y == 114))) {
		quest::emote("Beep.. Beep.. Beep..");
		quest::pause(60);
	}
	#:: Match if signal from steamfont/Jogl_Doobraugh.pl is "2"
	if ($signal==2) {
		#:: Start path grid 178
		quest::start(178);
	}
	#:: Match if signal from steamfont/Jogl_Doobraugh.pl is "3"
	if ($signal==3) {
		#:: Start path grid 179
		quest::start(179);
	}
}
