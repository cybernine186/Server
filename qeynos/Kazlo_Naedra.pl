sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name.  I'm Kazlo Naedra of the Order of Three.  We always seem to be running out of [supplies] around here, which is, of course, very distracting to our studies.");
	}
	elsif ($text=~/supplies/i) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("Yes, we're almost out of [blank scroll sheets]. Gahlith will be very upset, unless I can replenish our inventory soon.");
		}
		else {
			quest::say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!");
		}
	}
	elsif ($text=~/blank scroll sheets/i) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("These blank sheets seem harder to find every month. All the local merchants are out of them. Hopefully, one of the merchants out in Surefall will have some.");
		}
		else {
			quest::say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!");
		}
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 10
	if ($wp == 10) {
		quest::say("Hey guys, you got any blank scroll sheets for sale? Or know where I could get some around here?");
		#:: Send a signal "3" to South Qeynos >> Barthal (1115) with no delay
		quest::signalwith(1115,3,0);
	}
}

sub EVENT_ITEM {
	#:: Match a 18006 - Blank Scroll Sheets
	if (plugin::takeItems(18006 => 1)) {
		quest::say("Good work, $name! Here's a little something for your troubles. Your quick work and loyalty will be noted by the Order of Three.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(342, 5); 		#:: + Order of Three
		quest::faction(221, -1);		#:: - Bloodsabers
		quest::faction(262, 1);			#:: + Guards of Qeynos
		quest::faction(296, -1);		#:: - Opal Darkbriar
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 5 to 20cp
		my %cash = plugin::RandomCash(5,20);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
