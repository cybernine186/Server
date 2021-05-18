sub EVENT_DEATH_COMPLETE {
	my $random_result = int(rand(100));
	if ($random_result >= 94) {
		#:: Spawn a Steamfont Mountains >> Minotaur_Hero (56152)
		quest::unique_spawn(56152,177,0,-1294,1360,-103);
	}
	elsif ($random_result >= 88 && $random_result < 94) {
		#:: Spawn a Steamfont Mountains >> Minotaur_Lord (56161)
		quest::unique_spawn(56161,0,0,-2179,1319,-101.2);
	}
	quest::say("I die soon! Meldrath, help me!");
}
