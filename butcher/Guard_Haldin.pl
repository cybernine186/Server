#:: Create a scalar variable to store a state
my $FlavorTrigger;

sub EVENT_SPAWN {
	#:: Create a proximity 200 units across and 50 units high, without proximity say
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100, $z - 25, $z + 25, 0);
	#:: Set the state to false
	$FlavorTrigger = 0;
}

sub EVENT_ENTER {
	#:: Match if the flavor text has not been triggered
	if ($FlavorTrigger == 0) {
		#:: Create a timer 'haldin_client_check' that triggers every 30 seconds
		quest::settimer("haldin_client_check", 30);
		#:: Create a timer 'warning' that triggers every 60 seconds (1 min)
		quest::settimer("warning", 60);
		#:: Set the flavor text trigger state to true
		$FlavorTrigger = 1;
		quest::say("WARNING TO ALL TRAVELERS!  Bandits have been sighted on the road ahead. Beware!");
	}
}

sub EVENT_TIMER {
	#:: Match timer 'haldin_client_check'
	if ($timer eq "haldin_client_check") {
		#:: Pull a list of clients from the entity list
		my @ClientList = $entity_list->GetClientList();
		#:: Match if the ClientList array is empty
		if (scalar @ClientList == 0) {
			#:: Set the flavor text trigger state to false
			$FlavorTrigger = 0;
			#:: Stop the timer 'warning'
			quest::stoptimer("warning");
			#:: Stop the timer 'haldin_client_check'
			quest::stoptimer("haldin_client_check");
		}
		else {
			#:: Set the flavor text trigger state to true
			$FlavorTrigger = 1;
		}
	}
	#:: Match timer 'warning'
	elsif ($timer eq "warning") {
		if ($FlavorTrigger == 1) {
			quest::say("WARNING TO ALL TRAVELERS!  Bandits have been sighted on the road ahead. Beware!");
		}
	}
}

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("For the glory of Kaladim, have at thee!!");
		#:: Stop the timer 'warning'
		quest::stoptimer("warning");
		#:: Stop the timer 'haldin_client_check'
		quest::stoptimer("haldin_client_check");	
	}
	else {
		quest::say("For the glory of Kaladim!! You are no more.");
		#:: Create a timer 'haldin_client_check' that triggers every 30 seconds
		quest::settimer("haldin_client_check", 30);
		#:: Create a timer 'warning' that triggers every 60 seconds (1 min)
		quest::settimer("warning", 60);
	}
}

sub EVENT_ITEM {
	#:: Match a 18905 - Worn Rune (Csb I.O.U Dwf 1)
	if (plugin::takeItems(18905 => 1)) {
		quest::say("'Eh, strapling? Ye got this from me ol' partner? Huh. Aye, I know what it means but ye're not hearin'. Here, take this. It was his but he's not needin' it now.");
		#:: Give a random reward:  5037 - Bronze Two Handed Battle Axe, 5032 - Bronze Axe, 13313 - Dwarven Axe
		quest::summonitem(quest::ChooseRandom(5037, 5032, 13313));
		#:: Ding!
		quest::ding();
		#:: Grant a large amount of experience
		quest::exp(30000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My brothers of the Stormguard shall avenge me!! Your days are numbered!");
}
