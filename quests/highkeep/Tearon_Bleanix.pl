sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("The single death of a member of the Paladins of Tunare shall plague your wretched life.");
	}
}

sub EVENT_SLAY {
	quest::say("Let no evil beings stand in the way of the righteousness of the Paladins of Tunare!");
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello sir. Are you a citizen of Highpass?");
	}
	elsif ($text=~/not a citizen/i) {
		quest::say("Nor am I. I find this cities love of greed appalling. Do not you?");
	}
	elsif ($text=~/appalling/i) {
		quest::say("Yes. This city of vices is second only to Neriak. And it is trouble with Neriak that has sent me here. In search of my peoples princess.");
	}
	elsif ($text=~/princess/i) {
		quest::say("The Princess Lenya Thex is the daughter of His Royal Majesty, King Tearis Thex of Felwithe. She was on her way to Qeynos when we believe she was kidnapped by Carson McCabe, the governor of this vile city. I cannot get in the guards are on to me. How do you feel about becoming a hero to the Koada'dal or as you call us, high elves.");
	}
#::	elsif ($text=~/all is not bright above the clouds/i) {
#::		#:: Match if faction is Amiable or better
#::		if ($faction <= 4) {
#::			quest::say("Taken from this place she has been.  Seek the Highpass hussy.  Ask of her.  Only she knows where.  Find the Princess.  Give her this.  Show your allegiance.  This and her key. Then return the room key to me with the prize from the princess.  Become a hero!!");
#::			#:: Give item 13108 - Tearons Bracer
#::			quest::summonitem(13108);
#::			#:: Ding!
#::			quest::ding();	
#::		}
#::		else {
#::			quest::say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
#::		}
#::	}
	elsif (($text=~/want to be a hero/i) || ($text=~/become a hero/i)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Well let's get started on making you a hero. You must take Elite Guard Bracer. Look for Princess Lenya. When you find her give her the bracer to prove you are with the Koada'dal. She should trust you then. Then return to me with Princess Lenya and return my bracer. Be safe my friend.");
			#:: Give item 13108 - Tearons Bracer
			quest::summonitem(13108);
			#:: Ding!
			quest::ding();
			#:: Spawn one and only one Princess_Lenya_Thex (51176)
			quest::unique_spawn(51176, 0, 0, -202, 85, 74, 400); ## Removed the spawn... If not, can exploit this by chain spawning for quest turn in XP. - Darksinga 3/4/21
		}
		else {
			quest::say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		}
	}
}

sub EVENT_TIMER {
	#:: Match a timer 'depop'
	if ($timer eq "depop") {
		#:: Stop the timer 'depop' from triggering
		quest::stoptimer("depop");
		#:: Depop with spawn timer active
		quest::depop_withtimer();
	}
}

sub EVENT_ITEM {
	#:: Match a 13112 - Tearon's Bracer
	if (plugin::takeItems(13112 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("King Tearis Thex thanks you my friend. Could you please hand the princess this amulet. It is hers. I pryed it from the hands of some beggar.");
			#:: Give a 13109 - Royal Amulet of Thex
			quest::summonitem(13109);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(226, 25); 		#:: + Clerics of Tunare
			quest::faction(279, 25); 		#:: + King Tearis Thex
			quest::faction(5001, 10);		#:: + Anti-Mage
			#:: Grant a small amount of experience
			quest::exp(100);
			#:: Spawn one and only one Princess_Lenya_Thex (51176), without guild war or pathgrid, at the specified location
			quest::unique_spawn(51176, 0, 0, 52, 9, 2.5, 252);
		}
		else {
			quest::say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
			#:: Give a 13112 - Tearon's Bracer
			quest::summonitem(13112);
		}
	}
#::	#:: Match a 12267 - Highkeep Royal Suite, and a 13109 - Royal Amulet of Thex
#::	elsif (plugin::takeItems(12267 => 1, 13109 => 1)) {
#::		#:: Match if faction is Amiable or better
#::		if ($faction <= 4) {
#::			quest::say("Peace..  I can rest now.  You now hold my Silent Watch Shield.  Protect Felwithe..");
#::			#:: Give a 9312 - Silent Watch Shield
#::			quest::summonitem(9312);
#::			#:: Ding!
#::			quest::ding();
#::			#:: Set factions
#::			quest::faction(5001, 10);			#:: + Anti-Mage
#::			quest::faction(226, 25); 			#:: + Clerics of Tunare
#::			quest::faction(279, 25); 			#:: + King Tearis Thex
#::			#:: Grant a moderate amount of experience
#::			quest::exp(2000);
#::			#:: Set a timer 'depop' to trigger every 240 seconds (4 min)
#::			quest::settimer("depop", 240);
#::		}
#::		else {
#::			quest::say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
#::			#:: Give a 12267 - Highkeep Royal Suite
#::			quest::summonitem(12267);
#::			#:: Give a 13109 - Royal Amulet of Thex
#::			quest::summonitem(13109);
#::		}
#::	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
