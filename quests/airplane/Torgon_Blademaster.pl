sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. Are you a [true warrior]?");
	}
	if ($text=~/true warrior/i) {
		quest::say("Then you shall be tested as one. Choose. Do you wish to be tested by Falorn or Ogog?");
	}
	if ($class eq "Warrior") {
		if ($text=~/falorn/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Falorn (71067), without grid or guild war, at the specified location
			quest::spawn2(71067, 0, 0, 563.3, 1392.4, -766.9, 63.4);
			quest::depop();
		}
		if ($text=~/ogog/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Ogog (71064), without grid or guild war, at the specified location
			quest::spawn2(71064, 0, 0, 563.3, 1392.4, -766.9, 63.4);
			quest::depop();
		}
	}
}
