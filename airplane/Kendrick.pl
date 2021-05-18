sub EVENT_SPAWN {
	#:: Create a timer 'kendrick_depop' that triggers every 300 seconds (5 min)
	quest::settimer("kendrick_depop", 300);
}

sub EVENT_TIMER {
	#:: Match timer 'kendrick_depop'
	if ($timer eq "kendrick_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! Do you wish to begin your test of Thievery, Silence, or Trickery?");
	}
	elsif ($text=~/thievery/i) {
		quest::say("Thievery is absolute. Travel beyond and bring forth an Ivory Tessera, a gem of invigoration, and an inlaid choker to complete the test of thievery and earn the wispy choker of vigor!");
	}
	elsif ($text=~/silence/i) {
		quest::say("Silence makes us deadly. Proceed upward and bring to me a spiroc sky totem, a pearlescent globe, and a black griffon feather. Griffon Wing Spauldors shall be yours if you complete this.");
	}
	elsif ($text=~/trickery/i) {
		quest::say("Trickery, ahh how Fizzlethorpe blesses us! Adventure and return a mottled spiroc feather, a cracked leather belt, and a sphinxian circlet to complete the test of trickery and earn Renards Belt of Quickness.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20928 - Ivory Tessera, a 20984 - Gem of Invigoration, and a 20985 - Inlaid Choker
	if (plugin::takeItems(20928 => 1, 20984 => 1, 20985 => 1)) {			#:: Rogue Test of Thievery
		quest::say("Excellent! Fizzlethorpe blesses you with this gift.");
		#:: Give a 14552 - Wispy Choker of Vigor
		quest::summonitem(14552);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20989 - Spiroc Sky Totem, a 20942 - Pearlescent Globe, and a 20988 - Black Griffon Feather
	elsif (plugin::takeItems(20989 => 1, 20942 => 1, 20988 => 1)) {			#:: Rogue Test of Silence
		quest::say("Excellent! Fizzlethorpe blesses you with this gift.");
		#:: Give a 2703 - Griffon Wing Spauldors
		quest::summonitem(2703);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20956 - Mottled Spiroc Feather, a 20992 - Cracked Leather Belt, and a 20993 - Sphinxian Circlet
	elsif (plugin::takeItems(20956 => 1, 20992 => 1, 20993 => 1)) {			#:: Rogue Test of Trickery
		quest::say("Excellent! Fizzlethorpe blesses you with this gift.");
		#:: Give a 11676 - Renard's Belt of Quickness
		quest::summonitem(11676);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
