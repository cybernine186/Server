sub EVENT_SPAWN {
	#:: Create a timer 'depop' that triggers every 600 seconds (10 min)
	quest::settimer("depop", 600);
}

sub EVENT_TIMER {
	#:: Match timer 'depop'
	if ($timer eq "depop") {
		#:: Stop the timer 'depop' from triggering
		quest::stoptimer("depop");
		#:: Depop
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		#:: Match if she is in the locked room at the specified coordinates
		if ($x == -202 && $y == 85) {
			quest::say("Are not you a little short for a Highpass Guard?");
		}
		#:: Match if she is free
		else {
			quest::say("Greetings. You may rise. I am sure that you are honored to make my accquaintance. I am Princess Lenya Thex. It is not often that I speak with common folk.");
		}
	}
	elsif ($text=~/not a highpass guard/i) {
		quest::say("Of course not. You are far too puny. Then what is your business here in my cell?");
	}
	elsif ($text=~/tearon sent me/i) {
		quest::say("Tearon sent you?!! Then you must be here to rescue me.. Wait. This could just be a trap. The escaping Princess is killed by the guards. You must have proof that you are with Tearon.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13108 - Tearon's Bracer
	if (plugin::takeItems(13108 => 1)) {
		quest::say("So you are a member of the Silent Watch!! They are accepting anyone these days. I shall leave then. Here is your bracer back. Thank you for unlocking the door.");
		#:: Give a 13112 - Tearon's Bracer
		quest::summonitem(13112);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(279, 5);		#:: + King Tearis Thex
		quest::faction(246, 5);		#:: + Faydarks Champions
		quest::faction(285, -5);	#:: - Mayong Mistmoore
		quest::faction(304, -5);	#:: - Ring of Scale
		quest::faction(5019, -5);	#:: - King Aythox Thex
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Depop
		quest::depop();
	}
	#:: Match a 13109 - Royal Amulet of Thex
	elsif (plugin::takeItems(13109 => 1)) {
		quest::say("The Royal Amulet of Thex!! I missed it so. I am sorry I escaped so quickly. I am glad you did not run into the Teir'Dal torturers. They are quite formidable. I shall be continuing on to Qeynos. Here. Take this as proof that you have rescued me. My father should be quite happy with your deed. Such beauty as mine should never be locked up. If you cannot find my father then search for Tolon Nurbyte. He is usually at the Traveler's Inn. Good bye.");
		#:: Give a 18841 - Sealed Letter
		quest::summonitem(18841);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(279, 5);		#:: + King Tearis Thex
		quest::faction(246, 5);		#:: + Faydarks Champions
		quest::faction(285, -5);	#:: - Mayong Mistmoore
		quest::faction(304, -5);	#:: - Ring of Scale
		quest::faction(5019, -5);	#:: - King Aythox Thex
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Depop
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
