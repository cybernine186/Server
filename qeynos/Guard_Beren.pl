sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, and enable proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 1);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("What do you want? Are you friends with that lousy [dwarf]?! You had better not be unless you want to spend the rest of the week bleeding!");
	}
	elsif ($text=~/dwarf/i) {
		quest::say("That dwarf, Trumpy, who Corshin here thinks is a friend of Commander Bayle's, keeps pestering my poor brother Faren. I have had just about enough of him and [his kind].");
	}
	elsif ($text=~/his kind/i) {
		quest::say("You know... thieves, drunks and murderers. Decent folk just don't have a chance anymore.");
	}
	elsif ($text=~/faren/i) {
		quest::say("My brother Faren is a fine fisherman just like our father was. He fishes out there on the East Dock just about every day.");
	}
}

sub EVENT_PROXIMITY_SAY {
	if ($text=~/brother/i) {
		quest::say("My brother Faren is a fine fisherman just like our father was. He fishes out there on the East Dock just about every day.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match when NPC arrives at waypoint 5
	if ($wp == 5) {
		quest::say("How are they biting, little brother?");
		#:: Send a signal "1" to South Qeynos >> Faren (1159) with no delay
		quest::signalwith(1159,1,0);
	}
}

sub EVENT_SIGNAL {
	#:: Match signal 1 from qeynos/Lieutenant_Arathur.pl
	if (($signal == 1) && ($x == -145 && $y == -247)) {
		quest::say("Yes, sir!");
	}
	#:: Match signal 2 from qeynos/Faren.pl
	elsif ($signal == 2) {
		quest::say("Don't you worry about him! I will take care of Trumpy Irontoe once and for all!");
	}
	#:: Match signal 3 from qeynos/Trumpy_Irontoe.pl
	elsif (($signal == 3) && ($x == -145 && $y == -247)) {
		quest::say("Curse you, Trumpy!!!");
		#:: Send a signal "2" to South Qeynos >> Guard_Corshin (1091) with no delay
		quest::signalwith(1091,2,0);
	}
	#:: Match signal 4 from qeynos/Trumpy_Irontoe.pl
	elsif (($signal == 4) && ($x == -145 && $y == -247)) {
		quest::say("If you ever talk that way about my [brother] again, I will throw your butt into the dungeon. I don't care who you know!");
		#:: Send a signal "2" to South Qeynos >> Trumpy_Irontoe (1042) with no delay
		quest::signalwith(1042,2,0);
		#:: Send a signal "2" to South Qeynos >> Guard_Corshin (1091) with 5 second delay
		quest::signalwith(1091,2,5);
	}
	#:: Match signal from qeynos/Guard_Corshin.pl
	elsif (($signal == 5) && ($x == -145 && $y == -247)) {
		quest::say("Heh, Speak for yourself, Corshin. That one looks like a troublemaker to me.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
