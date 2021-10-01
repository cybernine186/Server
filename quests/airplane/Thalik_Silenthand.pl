sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.  Do you believe you are a great rogue?");
	}
	if ($text=~/great rogue/i) {
		quest::say("I will not take your word for it!  You must prove your greatness to one of my apprentices.  Do you wish to be tested by Rayne or by Kendrick?");
	}
	if ($class eq "Rogue") {
		if ($text=~/rayne/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Rayne (71061), without grid or guild war, at the specified location
			quest::spawn2(71061, 0, 0, 563.3, 1372.6, -766.9, 63.4);
			quest::depop();
		}
		elsif ($text=~/kendrick/i) {
			quest::say("I will summon him for you then");
			#:: Spawn a The Plane of Sky >> Kendrick (71068), without grid or guild war, at the specified location
			quest::spawn2(71068, 0, 0, 563.3, 1372.6, -766.9, 63.4);
			quest::depop();
		}
	}
}
