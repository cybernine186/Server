sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("How dare you! You attack us after we allow you to enter our domain in peace? Time for you to die!");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. This is my domain and I hope you have a peaceful stay. That is, unless the [lunatic sent you].");
	}
	elsif ($text=~/lunatic sent me/i) {
		quest::say("Oh, I see. I suppose you [want these cursed markers] that lunatic made me hold?");
	}
	elsif ($text=~/cursed markers/i) {
		quest::say("I am afraid that I can not just give them away. The lunatic had them cursed. They make me do [strange things]");
	}
	elsif ($text=~/strange things/i) {
		quest::say("Like ATTACK you!");
		#:: Attack the player who triggered the event
		quest::attack($name);
	}
}

sub EVENT_DEATH_COMPLETE {
	#:: Key a data bucket
	$key = sirran_status;
	#:: Set a value of '3' for 900 seconds (15 min)
	quest::set_data($key, "3", 900);
	#:: Spawn one and only one The Plane of Sky >> Sirran_the_Lunatic (71058), without grid or guild war, at the current location
	quest::unique_spawn(71058, 0, 0, $x, $y, $z);
}
