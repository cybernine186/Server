sub EVENT_SIGNAL {
	#:: Match signal "1" from Qeynos/Gash_Flockwalker.pl
	if ($signal == 1) {
		quest::attacknpctype(1138);
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 3
	if ($wp == 3) {
		quest::say("Pardon me.  Have you seen a man named Gash Flockwalker?  He hails from Surefall Glade.");
		#:: Send a signal "1" to South Qeynos >> Tasya_Huntlan (1104) with no delay
		quest::signalwith(1104,1,0);
	}
	#:: Match waypoint 7
	elsif ($wp == 7) {
		#:: Stop pathing grid 68
		quest::stop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello, friend. I am visiting from the plains. I hope to make a FORTUNE here in Qeynos.");
	}
	elsif ($text=~/gash flockwalker/i) {
		quest::say("Gash Flockwalker is a druid from Surefall Glade. I have a special delivery for him.");
	}
	elsif ($text=~/special delivery/i) {
		#:: Attack the player who triggered the event
		quest::attack($name);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	#:: Send a signal "1" to South Qeynos >> Gash_Flockwalker (1138) with no delay
	quest::signalwith(1138,1,0);
}
