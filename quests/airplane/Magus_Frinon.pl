sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.  Have you come here to test your abilities as a magician?");
	}
	if ($class eq "Magician") {
		if ($text=~/magician/i) {
			quest::say("Choose your tester. Frederic or Roanis.");
		}
		elsif ($text=~/frederic/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Frederic_Calermin (71088), without grid or guild war, at the specified location
			quest::spawn2(71088, 0, 0, 614.5, 1304.1, -766.9, 255);
			quest::depop();
		}
		elsif ($text=~/roanis/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Roanis_Elindar (71094), without grid or guild war, at the specified location
			quest::spawn2(71094, 0, 0, 614.5, 1304.1, -766.9, 255);
			quest::depop();
		}
	}
}
