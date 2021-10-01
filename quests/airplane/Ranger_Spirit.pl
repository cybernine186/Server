sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. Are you a true servant of the Pine?");
	}
	if ($class eq "Ranger") {
		if ($text=~/servant of the pine/i) {
			quest::say("Very well my friend. In order to reach your true potential you must pass many tests. Relinin Skyrunner and Gordon Treecaller are here to perform these tests. Please choose one.");
		}
		elsif ($text=~/relinin skyrunner/i) {
			quest::say("I shall summon him for you then");
			#:: Spawn The Plane of Sky >> Relinin_Skyrunner (71095), without grid or guild war, at the specified location
			quest::spawn2(71095, 0, 0, 617.1, 1399.5, -766.9, 129.4);
			quest::depop();
		}
		elsif ($text=~/gordon treecaller/i) {
			quest::say("I shall summon him for you then");
			#:: Spawn The Plane of Sky >> Gordon_Treecaller (71090), without grid or guild war, at the specified location
			quest::spawn2(71090, 0, 0, 592.8, 1400.1, -766.9, 129.4);
			quest::depop();
		}
	}
}
