sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello..  Welcome to the Wind Spirit's Song.  I'm Sansa, and I help out the local bards here.");
	}
	elsif ($text=~/fabian/i) {
		quest::say("Ahh - jolly Fabian. He is one of our best customers! That is, of course, due to the fact that he has the heaviest fingers of any bard I know. Anyhow, down to business. I assume he sent you for a new set of strings. Unfortunately, I have not been able to procure any of the [special - uhh - things] needed to make his strings lately.");
	}
	elsif ($text=~/special - uhh - things/i) {
		quest::say("Uhh - ummm - uhhh - Fabian does not know this, but his strings are - uh - made of - uh - [troll guts].");
	}
	elsif ($text=~/troll guts/i) {
		quest::say("Well, Fabian likes the thick resonance that only troll gut strings can provide. Trouble is, trolls are scarce around these parts,thank the gods, but Fabian breaks his strings as fast as I find suppliers. Trolls sometimes wander the Karanas in search of food but that is so rare, to see one there. Anyhow, if you find one out in the Karanas, bring me his guts and I can make the strings to take to Fabian.");
	}
}

sub EVENT_ITEM {
	#:: Turn in for 13703 -  Bag of Troll Guts & 1 Platinum
	if (plugin::takeItemsCoin(0, 0, 0, 1, 13703 => 1)) {
		quest::say("I am not even going to bother asking where you got that. Just take this set I already made and hurry them back to Fabian.");
		#:: Give item 13709 Lut Strings
		quest::summonitem(13709);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(284,30); 		#:: + League of Antonican Bards
		quest::faction(281,30); 		#:: + Knights of Truth
		quest::faction(262,30); 		#:: + Guards of Qeynos
		quest::faction(304,-30); 		#:: - Ring of Scale
		quest::faction(285,-30); 		#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Send a signal "1" to South Qeynos >> Belious_Naliedin (1125) with a 0 second delay
		quest::signalwith(1125, 1, 0);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
