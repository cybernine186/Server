sub EVENT_SPAWN {
	#:: Set Depop Timer for 30 minutes
	quest::settimer("depop",1800);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I do not desire any company other than my bodyguards. Be off!!");
	}
} 

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_TIMER {
	#:: Catch the "depop" timer
	if ($timer eq "depop") {
		#:: Stop the timer "depop"
		quest::stoptimer("depop");
		#:: Send a signal '1' to High Keep >> Lartin (6186) with no delay
		quest::signalwith(6186, 1, 0);
		#:: Send a signal '1' to High Keep >> Grex (6187) with no delay
		quest::signalwith(6186, 1, 0);
		#:: Depop with spawn timer active
		quest::depop_withtimer();
	}
}

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) { 
		quest::say("You have made a big mistake choosing to battle a high member of the Circle of Unseen Hands. Now you shall pay!!"); 
	}
}

sub EVENT_DEATH {
	quest::say("Big mistake, my friend!! The Circle of Unseen Hands shall surely find and cut you down for the death of the nephew of Renux Herkanon. My bodyguards will be waiting for you!!");
	#:: Send a signal '1' to High Keep >> Lartin (6186) with no delay
	quest::signalwith(6186, 1, 0);
	#:: Send a signal '1' to High Keep >> Grex (6187) with no delay
	quest::signalwith(6186, 1, 0);
	#:: Stop the timer "depop"
	quest::stoptimer("depop");
}
