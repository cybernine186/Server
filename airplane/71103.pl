#:: Bazzazzt - #1
sub EVENT_DEATH_COMPLETE {
	#:: Spawn a The Plane of Sky >> Bizazzzt (71102), without grid or guild war, at the current location
	quest::spawn2(71102, 0, 0, $x, $y, $z, $h);
}
