sub EVENT_DEATH_COMPLETE{
	$random_result = quest::ChooseRandom(1, 2, 3, 4);
	if ($random_result == 1) {
		#:: Spawn a Dagnor's Cauldron >> an_aqua_goblin_mariner (70060) on pathgrid 5
		quest::spawn2(70060, 5, 0, -296.37, -122.31, -349.32, 122);
	}
	elsif ($random_result == 2) {
		#:: Spawn a Dagnor's Cauldron >> #an_undertow_skeleton (70062) on pathgrid 6
		quest::spawn2(70062, 6, 0, -974.5, 436.4, -343.8, 29);
	}
	elsif ($random_result == 3) {
		#:: Spawn a Dagnor's Cauldron >> #aqua_goblin_shaman (70061) on pathgrid 7
		quest::spawn2(70061, 7, 0, -848.3, -184.8, 216.3, 37.3);
	}
	elsif ($random_result == 4) {
		#:: Spawn a Dagnor's Cauldron >> #a_cauldron_rat (70063) on pathgrid 8
		quest::spawn2(70063, 8, 0, 612.6, 625.2, 209.0, 175.6);
	}
}
