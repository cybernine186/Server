#:: Bilge Farfathom spawn
#:: an_aqua_goblin_mariner - trigger for #Bilge_Farfathom 70059

sub EVENT_DEATH_COMPLETE{
	#:: Set a scalar variable to store random 100
	my $random_result = int(rand(100));
	if ($random_result < 85) {
		#:: Spawn 70061 - #aqua_goblin_shaman
		quest::spawn2(70061,6,0,-974.5,436.4,-343.8,29);
	}
	else {
		#:: Spawn 70059 - #Bilge_Farfathom
		quest::spawn2(70059,4,0,-1123.30,-1194.57,-98.32,122);
	}
}
