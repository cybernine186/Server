sub EVENT_DEATH_COMPLETE {
	#:: Spawn a The Plane of Sky >> Bazzt_Zzzt (71072), without grid or guild war, at the current location
	quest::spawn2(71072, 0, 0, $x, $y, $z, $h);
}
