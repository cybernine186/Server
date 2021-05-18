sub EVENT_SAY {
	#:: Match if Faydark's Champions faction is Indifferent or better.
	if ($faction <= 5) {
		if ($text=~/hail/i) {
			quest::say("How are you? Please rest. Have you [been wounded by the beasts] of this region.");
		}
		elsif ($text=~/been wounded by the beasts/i) {
			quest::say("Ah. Perhaps you should speak with Nyrien. Just inform him you 'need to be healed'.");
		}
		elsif ($text=~/faldor hendrys/i) {
			quest::say("Ha!! You seek my foul brother, Faldor Hendrys?!! He is my half brother and has left to live with the vile half of his ancestry in Qeynos. No doubt he has decided to lend his talents to the local thieves' guild. Good luck finding him.");
		} 
	} 
	else {
		quest::say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from /cauldron/Ghilanbiddle_Nylwadil.pl
	if ($signal == 1) {
		quest::say("Pipe down, Ghil!! We have no quarrel with this adventurer.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("You have met your match!!");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("You have earned the vengeance of Faydark's Champions.");
}
