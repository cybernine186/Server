#:: Bzzazzt - #1
sub EVENT_DEATH_COMPLETE {
	#:: Spawn a The Plane of Sky >> Bazzzazzt (71103), without grid or guild war, at the current location
	quest::spawn2(71103, 0, 0, $x+10, $y, $z, $h);
	#:: Spawn a The Plane of Sky >> Bazzzazzt (71103), without grid or guild war, at the current location
	quest::spawn2(71103, 0, 0, $x-10, $y, $z, $h);
}
