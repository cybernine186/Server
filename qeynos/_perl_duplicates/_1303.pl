sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Grahan_Rothkar.pl
	if ($signal == 1) {
		quest::depop();
	}
}
