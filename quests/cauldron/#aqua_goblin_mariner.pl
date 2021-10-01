#:: Bilge Farfathom spawn
#:: #aqua_goblin_mariner - spawns 1 of 4 Bilge triggers

sub EVENT_DEATH_COMPLETE {
	#:: Match a scalar variable for mariner died once
	if ($mdied==1) {
		#:: Do nothing.
	} 
	else {
		#:: Spawn an_aqua_goblin_mariner
		quest::spawn2(70060,5,0,-296.37,-122.31,-349.32,122);
		#:: Set a scalar variable for mariner died once
		$mdied=1;
	}
}
