sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings $name.  Do you feel that you are ready to be tested in song?");
	}
	if ($class eq "Bard") {
		if ($text=~/tested in song/i) {
			quest::say("The test of songs holds both joy and sorrow. Choose who you wish to begin with, Denise or Clarisa");
		}
		elsif ($text=~/clarisa/i) {
			quest::say("I shall summon them for you");
			#:: Spawn a The Plane of Sky >> Clarisa_Spiritsong (71081), without grid or guildwar, at the specified location
			quest::spawn2(71081, 0, 0, 660.7, 1388.9, -766.9, 192.6);
			quest::depop();
		}
		elsif ($text=~/denise/i) {
			quest::say("I shall summon them for you");
			#:: Spawn a The Plane of Sky >> Denise_Songweaver (71082), without grid or guildwar, at the specified location
			quest::spawn2(71082, 0, 0, 660.7, 1368.4, -766.9, 192.6);
			quest::depop();
		}
	}
}
