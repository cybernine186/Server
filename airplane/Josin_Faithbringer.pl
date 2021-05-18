sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.  Are you ready to begin your test of faith?");
	}
	if ($class eq "Cleric") {
		if ($text=~/test of faith/i) {
			quest::say("I have faith that you will do well. Choose Alan or Deric");
		}
		elsif ($text=~/alan/i) {
			quest::say("I shall summon them for you");
			#:: Spawn The Plane of Sky >> Alan_Harten (71080), without grid or guild war, at the specified location
			quest::spawn2(71080, 0, 0, 660.7, 1361.6, -766.9, 193.2);
			quest::depop();
		}
		elsif ($text=~/deric/i) {
			quest::say("I shall summon them for you");
			#:: Spawn The Plane of Sky >> Deric_Lennox (71083), without grid or guild war, at the specified location
			quest::spawn2(71083, 0, 0, 660.7, 1338.0, -766.9, 193.2);
			quest::depop();
		}
	}
}
