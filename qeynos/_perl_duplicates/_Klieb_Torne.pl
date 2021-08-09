sub EVENT_SPAWN {
	#:: Create a timer "paw" that loops every 600 seconds (10 min)
	quest::settimer("paw", 600);
}

sub EVENT_TIMER {
	#:: Match timer "paw"
	if ($timer eq "paw") {
		quest::say("Can you believe that? That guy actually thinks he is going to find the [Paw of Opolla]! Bwah ha ha ha!");
		#:: Send a signal "1" to South Qeynos >> Micc_Koter (1072) with no delay
		quest::signalwith(1072, 1, 0);
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Micc_Koter.pl
	if ($signal == 1) {
		quest::say("Shut your hole, Micc, you dirty son of a kobold!");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hey, $name!  Do I know you from somewhere?  Highpass?  Nah, you ain't who I thought you were.  If I were you I would just keep my trap shut and buy some drinks.");
	}
	elsif ($text=~/paw of opolla/i) {
		quest::say("Heh? Why don't you mind your own business bub?! Buzz off!");
		#:: Send a signal "2" to South Qeynos >> Micc_Koter (1072) with no delay
		quest::signalwith(1072, 2, 0);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
