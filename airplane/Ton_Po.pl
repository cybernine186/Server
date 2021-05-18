sub EVENT_SPAWN {
	#:: Create a timer 'ton_depop' that triggers every 300 seconds (5 min)
	quest::settimer("ton_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'ton_depop'
	if ($timer eq "ton_depop") {
		quest::stoptimer("ton_depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("So, I have been called upon to test you, and test you I shall. I will give you the option of choosing your test though enlightened one. Shall you take the test of Strength, Sight, or Speed?");
	}
	elsif ($text=~/strength/i) {
		quest::say("So be it, the test of Strenth you shall have. Bring to me a Verdant Tessera, some Finely Woven Gold Mesh,  and some Silken Strands. The task will not be easy, but it should serve as an adequate test of Strengh, for one of your abilities.");
	}
	elsif ($text=~/sight/i) {
		quest::say("The test of sight is both a test of body and mind. The mind will allow you to see beyond that which is usually, invisible. Bring me a Gold Disc, a Tiny Ruby, and a Cracked Leather Eyepatch and I will assist you in seeing what should not be seen.");
	}
	elsif ($text=~/speed/i) {
		quest::say("The test of speed. Every Monk must be swift if he is to best his opponent. Speed in both mind and body is essential in many facets of life. Return to me an Adumbrate Globe, a Shimmering Opal, and some Dove Slippers and I shall aid your speed of mind.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20793 - Finely Woven Gold Mesh, a 20794 - Silken Strands, and a 20932 - Verdant Tessera
	if (plugin::takeItems(20793 => 1, 20794 => 1, 20932 => 1)) {			#:: Monk Test of Strength
		quest::say("You have done well, $name.");
		#:: Give a 1282 - Mystical Back Straps
		quest::summonitem(1282);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20796 - Cracked Leather Eyepatch, a 20939 - Gold Disc, and a 20795 - Tiny Ruby
	elsif (plugin::takeItems(20796 => 1, 20939 => 1, 20795 => 1)) {			#:: Monk Test of Sight
		quest::say("You have done well, $name.");
		#:: Give a 1281 - Ton Po's Eye Patch
		quest::summonitem(1281);
 		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20946 - Adumbrate Globe, a 20798 - Dove Slippers, and a 20797 - Shimmering Opal
	elsif (plugin::takeItems(20946 => 1, 20798 => 1, 20797 => 1)) {			#:: Monk Test of Speed
		quest::say("You have done well, $name.");
		#:: Give a 1280 - Sandals of Alacrity
		quest::summonitem(1280);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
