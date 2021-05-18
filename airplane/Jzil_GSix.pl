sub EVENT_SPAWN {
	#:: Create a timer 'jzil_depop' that triggers every 300 seconds (5 min)
	quest::settimer("jzil_depop", 300);
}

sub EVENT_TIMER {
	#:: Match timer 'jzil_depop'
	if ($timer eq "jzil_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Ah, so you have come to be tested. Many fine things can be your reward. There are three tests which I can administer. Shall you take the test of flight, power, or mind?");
	}
	elsif ($text=~/flight/i) {
		quest::say("So, you wish the test of flight? So be it. You must return to me a Verdant Tessera, an Ebon Shard, and a Griffons Beak to reap your rewards. May the darkness guide your steps.");
	}
	elsif ($text=~/test of power/i) {
		quest::say("The test of power it is. Prove yourself worthy of power and bring me a silver disc, spiroc feathers, and a black silk cape. Only then will you know true power.");
	}
	elsif ($text=~/mind/i) {
		quest::say("So, the test of mind it shall be. You must return to me, from this place of air and mist a Rogous Globe, some Djinni Blood, and some Fine Cloth Raiments. Then, and only then, you shall have the reward that you deserve!");
	}
}

sub EVENT_ITEM {
	#:: Match a 20932 - Verdant Tessera, a 20780 - Ebon Shard, and a 20781 - Griffon's Beak
	if (plugin::takeItems(20932 => 1, 20780 => 1, 20781 => 1)) {			#:: Necromancer Test of Flight
		quest::say("Very good. Now take this and leave me.");
		#:: Give a 27712 - Bloody Griffon-Hide Wrist Guard
		quest::summonitem(27712);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20938 - Silver Disc, a 20782 - Spiroc Feathers, and a 20783 - Black Silk Cape
	elsif (plugin::takeItems(20938 => 1, 20782 => 1, 20783 => 1)) {			#:: Necromancer Test of Power
		quest::say("Very good. Now take this and leave me.");
		#:: Give a 1278 - Cloak of Spiroc Feathers
		quest::summonitem(1278);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20945 - Rugous Globe, a 20784 - Djinni Blood, and a 20785 - Fine Cloth Raiment
	elsif (plugin::takeItems(20945 => 1, 20784 => 1, 20785 => 1)) {			#:: Necromancer Test of Mind
		quest::say("Very good. Now take this and leave me.");
		#:: Give a 1279 - Bloodsoaked Raiment
		quest::summonitem(1279);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
