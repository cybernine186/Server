sub EVENT_DEATH_COMPLETE {
	my $random_result = int(rand(100));
	if ($random_result >= 94) {
		#:: Spawn a Steamfont Mountains >> Minotaur_Hero (56152)
		quest::unique_spawn(56152,177,0,-1294,1360,-103);
	}
	quest::say("I die soon! Meldrath, help me!");
}
