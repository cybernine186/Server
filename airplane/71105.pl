#:: Bzzazzt - #3
sub EVENT_DEATH_COMPLETE {
	#:: Spawn a The Plane of Sky >> Bazzzazzt (71107), without grid or guild war, at the current location
	quest::spawn2(71107, 0, 0, $x, $y, $z, $h);
}
