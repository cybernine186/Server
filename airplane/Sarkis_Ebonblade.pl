sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings. $name.  Have you come here to test your dark powers of skill and spell casting?");
	}
	if ($text=~/dark powers of skill/i) {
		quest::say("You will be tested by either Gragrot or Tynicon.  Choose one!");
	}
	if ($class eq "Shadowknight") {
		if ($text=~/gragrot/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Gragrot (71063), without grid or guild war, at the specified location
			quest::spawn2(71063, 0, 0, 563.3, 1351.9, -766.9, 63.4);
			quest::depop();
		}
		elsif ($text=~/tynicon/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Tynicon_DLin (71098), without grid or guild war, at the specified location
			quest::spawn2(71098, 0, 0, 563.3, 1351.9, -766.9, 63.4);
			quest::depop();
		}
	}
}
