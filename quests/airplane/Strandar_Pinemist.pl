sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings, young one. Are you a [child of the trees]?");
	}
	if ($text=~/child of the trees/i) {
		quest::say("Then you are welcome in my presence. I shall call forth some loyal children if you but speak the name. Will or Fenalla will serve you well.");
	}
	if ($class eq "Druid") {
		if ($text=~/will/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Will_Treewalker (71099), without grid or guild war, at the specified location
			quest::spawn2(71099, 0, 0, 563, 1311.4, -766.9, 65.4);
			quest::depop();
		}
		elsif ($text=~/fenalla/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Fenalla_Moonshadow (71086), without grid or guild war, at the specified location
			quest::spawn2(71086, 0, 0, 562.5, 1329.3, -766.9, 65.4);
			quest::depop();
		}
	}
}
