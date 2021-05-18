#:: Bazzazzt - #3
sub EVENT_DEATH_COMPLETE {
	#:: Spawn a The Plane of Sky >> Bzzzt (71101), without grid or guild war, at the current location
	quest::spawn2(71101, 0, 0, $x, $y, $z, $h);
}
