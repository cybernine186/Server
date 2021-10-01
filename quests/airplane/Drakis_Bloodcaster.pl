sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $race. Are you ready to begin?");
	}
	if ($class eq "Necromancer") {
		if ($text=~/ready to begin/i) {
			quest::say("Who would you like to be tested by? Jzil or Dugaas?");
		}
		elsif ($text=~/jzil/i) {
			quest::say("Very well.");
			#:: Spawn a The Plane of Sky >> Jzil_GSix (71074), without grid or guild war, at the specified location
			quest::spawn2(71074, 0, 0, 654.9, 1305, -762.2, 22);
			quest::depop();
		}
		elsif ($text=~/dugaas/i) { 
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Dugaas_Helpyre (71084), without grid or guild war, at the specified location
			quest::spawn2(71084, 0, 0, 661.6, 1302.8, -766.9, 254.9);
			quest::depop();
		}
	}
}
