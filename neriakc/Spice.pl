sub EVENT_ITEM {
	#:: Match two gold pieces
	if (plugin::takeCoin(0, 0, 2, 0)) {
		quest::say("HOOOORAY!!");
		#:: Set a timer 'dance' that triggers every 2 seconds
		quest::settimer("dance", 2);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_TIMER {
	#:: Match timer 'dance'
	if ($timer eq "dance") {
		#:: Increment the counter
		$count++;
		if ($count < 10) {
			#:: Do some dance moves
			quest::doanim(quest::ChooseRandom(28, 36, 40, 42, 51, 52, 53, 58, 60, 62, 64, 70));
		}
		else {
			#:: Stop timer
			quest::stoptimer("dance");
			#:: Reset the count
			$count = 0;
		}
	}
}
