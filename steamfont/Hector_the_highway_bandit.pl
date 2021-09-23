if(quest::is_the_shadows_of_luclin_enabled()){
	sub EVENT_SIGNAL {
		#:: Signal from steamfont/Cargo_Clockwork.pl
		quest::say("Victory is mine!");
		quest::depop();
	}
}