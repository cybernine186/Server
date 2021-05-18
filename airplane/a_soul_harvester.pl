my $entid1;
my $mob1;
my $mobnpc1;

sub EVENT_DEATH_COMPLETE {
	#:: Spawn a The Plane of Sky >> a_soul_tamer (71100)
	$entid1 = quest::spawn2(71100, 0, 0, $x, $y, $z, $h);
	$mob1 = $entity_list->GetMobID($entid1);
	$mobnpc1 = $mob1->CastToNPC();
	$mobnpc1->AddToHateList($npc->GetHateTop());
}
