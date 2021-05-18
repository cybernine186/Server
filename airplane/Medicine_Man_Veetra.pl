sub EVENT_SAY {
	if ($text=~/hail/i){
		quest::say("Good day to you, $name. Are you a shaman of [much experience]?");
	}
	if ($class eq "Shaman") {
		if ($text=~/much experience/i) {
			quest::say("Then welcome to the tests of the medicine man. I have two tomes, each tells of a shaman of great accomplishment. They are Gina MacStargan and Ooga. Simply tell me the name of the shaman you want to be tested by.");
		}
		elsif ($text=~/gina macstargan/i) {
			quest::say("I shall summon them for you");
			#:: Spawn a The Plane of Sky >> Gina_McStargan (71087), without grid or guild war, at the specified location
			quest::spawn2(71087, 0, 0, 631.9, 1401.9, -766.9, 129.8);
			quest::depop();
		}
		elsif ($text=~/ooga/i) {
			quest::say("I shall summon them for you");
			#:: Spawn a The Plane of Sky >> Ooga (71093), without grid or guild war, at the specified location
			quest::spawn2(71093, 0, 0, 653.4, 1399.0, -766.9, 129.8);
			quest::depop();
		}
	}
}
