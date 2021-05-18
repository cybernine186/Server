sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Hello. My brother Joogl is a great bixie hunter.  No one can smash bixies like my brother.  He is the best.  He works for [Kizzie Mintopp].");
	}
	elsif ($text=~/kizzie mintopp/i) {
		quest::say("Kizzie owns the Herb Shop in Rivervale. She is the keeper of the [honey jum recipe].");
	}
	elsif ($text=~/honey jum recipe/i) {
		quest::say("I do not know, but it tastes good on bixie crunchies.  Kizzie makes it with the honeycombs my brother collects from the bixies."); 
	}
}
