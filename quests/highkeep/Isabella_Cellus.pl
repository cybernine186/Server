sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello. How nice to meet you, $name!");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 8
	if ($wp == 8) {
		quest::say("Would you please leave me alone?!");
	}
	#:: Match waypoint 9
	elsif ($wp == 9) {
		quest::say("I need to get out of here.");
	}
	#:: Match waypoint 12
	elsif ($wp == 12) { 
		quest::say("Would you please stop following me!!");
	}
	#:: Match waypoint 16
	elsif ($wp == 16) {
		quest::say("I just adore this place.");
		#:: Send a signal '1' to High Keep >> Dealer_Shonta (6064) with no delay
		quest::signalwith(6064, 1, 0);
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from /highkeep/Dealer_Shonta.pl
	if ($signal == 1) {
		quest::say("This poor wretched man is no acquaintance of mine.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
