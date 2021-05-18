sub EVENT_SAY {
	#:: Match if faction is Indifferent or better
	if ($faction <= 5) {
		if ($text=~/hail/i) {
			quest::say("Greetings, my friend! You may rest here if you like. There are many dangers in this land. May Tunare watch over you when you depart our camp.");
			#:: Send a signal "1" to Dagnor's Cauldron >> Ghilanbiddle_Nylwadil (70007) with a five second delay
			quest::signalwith(70007, 1, 5);
		}
		elsif ($text=~/healed/i) {
			quest::say("I see. Then sit and rest a while. I must conserve my strength for our own interests. When you are ready to leave, go and ask Sigan to [escort you to the pass]. There, you can leave this dangerous land.");        
		}
		elsif ($text=~/faldor hendrys/i) {
			quest::say("Ha!! You seek my foul brother, Faldor Hendrys?!! He is my half brother and has left to live with the vile half of his ancestry in Qeynos. No doubt he has decided to lend his talents to the local thieves' guild. Good luck finding him.");
		}
	} 
	else {
		quest::say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from Ghilanbiddle_Nylwadil.pl
	if ($signal == 1) {
		quest::say("Leave our new friend alone, Ghilanbiddle.  He is quite welcome to rest amongst us.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Fabulous Four, attack!!");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My comrades will avenge my death.");
}
