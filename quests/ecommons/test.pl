sub EVENT_SAY {
	if ($text=~/untrain/i) {
		quest::untraindiscs();
	}
	if ($text=~/trainme/i) {
		quest::traindiscs(60,1);
	}
}
