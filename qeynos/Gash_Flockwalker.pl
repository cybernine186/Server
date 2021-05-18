sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Good day to you. Your city of stone walls is quite magnificent. Still, the glory of Surefall Glade puts this city to shame.");
	}
	elsif ($text=~/assassin/i) {
		quest::say("What!!?  Must be an Unkempt Druid Assassin nearby!!  Find him and slay him.  I am sure he stands to make a FORTUNE!  I believe the assassin may be carrying some sort of [black wood chip].");
		#:: Spawn one and only one South Qeynos >> Raffel_Minnmorn (1179) on grid 68
		quest::unique_spawn(1179, 68, 0, -100, 222, 3, 128);
	}
	elsif ($text=~/black wood chip/i) {
		quest::say("That is the mark of an Unkempt Druid.  Long ago there was a tree in Norrath we called the Great Tunarbos.  Legend says it spawned all the woodlands of Norrath.  Many centuries ago, long before the Combine Era, the Great Tunarbos was burned to the ground by unknown means.  The ancient rangers kept what little of the great tree they could find.  To make it short, all Unkempt Druids now carry burned wood chips to represent the great tree.  They are not real.  Take any black wood chips to Gerael Woodone in Surefall Glade.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 11
	if ($wp == 11) {
		#:: Send a signal "1" to South Qeynos >> Raffel_Minnmorn (1179) with no delay
		quest::signalwith(1179,1,0);
	}
	#:: Match waypoint 17
	elsif ($wp == 17) {
		quest::say("Even the beauty of the ocean pales in comparison to the towering pines of Surefall Glade.");
	}
	#:: Match waypoint 27
	elsif ($wp == 27) {
		quest::say("I have had a tree sap from Surefall Glade which tastes better than this ale.");
	}
}

sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/Raffel_Minnmorn.pl
	if ($signal == 1) {
		quest::say("Hey... he dropped something. You should most likely take it to Gerael Woodone in Surefall Glade. Tell me what it is.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
