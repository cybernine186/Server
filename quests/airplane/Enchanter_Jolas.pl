sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.  Have you come here to test your powers of enchantment?");
	}
	elsif ($text=~/enchantment/i) {
		quest::say("I am most honored to be able to help you. Please choose from one of my instructors. Lelulean or Enderbite.");
	}
	if ($class eq "Enchanter") {
		if ($text=~/lelulean/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Lelulean (71104), with no grid or guild war, at the specified location
			quest::spawn2(71104, 0, 0, 640, 1303.2, -766.9, 0.4);
			quest::depop();
		}
		elsif ($text=~/enderbite/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Enderbite (71085), with no grid or guild war, at the specified location			
			quest::spawn2(71085, 0, 0, 640, 1303.2, -766.9, 0.4);
			quest::depop();
		}
	}
}
