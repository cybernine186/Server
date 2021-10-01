sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.  Are you pure of heart and soul?");
	}
	elsif($text=~/heart and soul/i) {
		quest::say("Then choose. Do you wish your purity to be tested by Gregori or Dirkog?");
	}
	elsif ($text=~/gregori/i) {
	        quest::say("I will summon him for you then");
		#:: Spawn a The Plane of Sky >> Gregori_Lightbringer (71089), without grid or guild war, at the specified location
        	quest::spawn2(71089, 0, 0, 563, 1331.1, -766.9, 63.4);
	        quest::depop();
	}
	elsif ($text=~/dirkog/i) {
		quest::say("I will summon him for you then");
		#:: Spawn a The Plane of Sky >> Dirkog_Steelhand (71077), without grid or guild war, at the specified location
		quest::spawn2(71077, 0, 0, 563, 1331.1, -766.9, 63.4);
		quest::depop();
	}
}
