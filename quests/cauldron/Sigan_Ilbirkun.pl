sub EVENT_SAY {
	#:: Match if faction is Indifferent or better
	if ($faction <= 5) {
		if ($text=~/hail/i) {
			quest::say("Hail!! You are welcome to rest here.");
			#:: Send a signal "2" to Dagnor's Cauldron >> Ghilanbiddle_Nylwadil (70007) with a five second delay
			quest::signalwith(70007, 2, 5);
		}
		#:: Starts the escort player to Valley entrance
		elsif ($text=~/escort/i) {
			quest::say("Yes. Follow me closely!!");
			#:: NPC moves to the set coordinates then paths back (noguard)
			quest::moveto(-141.75, 1201.45, 141.42, 0);
		}
	} 
	else {
		quest::say("Your shifty eyes tell me that you are no ally of the Stormguard.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("It's bashing time!!");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My brothers of the Stormguard shall avenge me!! Your days are numbered!");
}
