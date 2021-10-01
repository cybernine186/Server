sub EVENT_WAYPOINT_ARRIVE {
	#:: Match at waypoint 2, 9, 14, 21, and 24
	if (($wp eq 2) || ($wp eq 9) || ($wp eq 14) || ($wp eq 21) || ($wp eq 24)) {
		quest::say("Ember?!  Ember?!  Where are you, girl?!");
		#:: Send a signal '1' to Misty Thicket >> Ember (33065) with no delay
		quest::signalwith(33065, 1, 0);
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from /misty/Ember.pl
	if ($signal == 1) {
		quest::say("There you are!  Stay close to me, girl.");
	}
}

sub EVENT_COMBAT {
	#:: Match combat_state 1 (true) for entered combat
	if ($combat_state == 1) {
		quest::say("What do you think you are doing?!?");
	}
}

sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Hail, $name! My name is Blixkin Entopop. Have you seen the wonderful assortment of [spiders] and [beetles] that inhabit the thicket? I have quite an extensive [bug collection]. Be careful, though. I have seen many brave halflings fall beneath a [swarm] of clicking and hissing bugs.");
	}
	elsif ($text=~/spiders/i) {
		quest::say("There are many species of bugs out here. The most common are the fire beetles. If you are hunting them, make sure their queen is not around or you will be in deep trouble. Their eyes are a popular item for adventurers because they give off light as if they were on fire. I even had one warrior try to kill [Ember] for her eyes!!");
	}
	elsif ($text=~/ember/i) {
		quest::say("I raised Ember from an egg. She is my faithful pet and quite smart for a beetle. There are plenty of other bugs to squish, out in the thicket, so you had best leave her alone or I will have to SQUISH you!");
	}
	elsif ($text=~/swarm/i) {
		quest::say("Bugs tend to swarm and defend others of their species when they are attacked. So keep your eyes peeled if you intend to squish any of them.. And you'd better not even THINK of squishing [Ember] or you will be sorry!");
	}
	elsif ($text=~/beetles/i) {
		quest::say("There are many species of bugs out here. The most common are the fire beetles. If you are hunting them, make sure their queen is not around or you will be in deep trouble. Their eyes are a popular item for adventurers because they give off light as if they were on fire. I even had one warrior try to kill [Ember] for her eyes!!");
	}
	elsif ($text=~/bug collection/i) {
		quest::say("I collect all kinds of bugs but most of the ones I have are dead. [Ember] is the only exception. I just like them for their pretty colors and I admire how loyal they are to each other. If you want to, you can help me complete my collection and I will reward you for your time. Here is a list of the bug parts I need for my collection. If you [don't have a box] to collect the bug parts in, just ask me for one. I think I have some extras.'");
	}
	elsif ($text=~/don't have a box/i) {
		quest::say("Here you go. Just follow the instructions on the [list] so you know what to collect and how to prepare the collection for me.");
		#:: Give a 17922 - Bug Collection Box
		quest::summonitem(17922);
	}
	elsif ($text=~/list/i) {
		quest::say("What did you do, lose the list? Here is another one. Hold onto it because I will want it back when you are done.");
		#:: Give a 18011 - Want List
		quest::summonitem(18011);
	}
}

sub EVENT_ITEM {
	#:: Match a 13268 - Complete Bug Collection and a 18011 - Want List
	if (plugin::takeItems(13268 => 1, 18011 => 1)) {
		quest::say("Excellent! Good work! I knew you were the one for this job! Thank you so much! My collection just gets better and better each day. Here is your reward as I promised.");
		#:: Give a random reward: 14010 - Potion of Poison Warding, 13281 - Silver Bracelet, 13280 - Bracelet of Beetlekind, 14015 - Spider Venom, 16875 - Stalking Probe
		quest::summonitem(quest::ChooseRandom(14010,13281,13280,14015,16875));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(292, 12);		#:: + Merchants of Rivervale
		quest::faction(241, 12);		#:: + Deeppockets
		quest::faction(263, 12);		#:: + Guardians of the Vale
		quest::faction(286, 12);		#:: + Mayor Gubbin
		quest::faction(336, -15);		#:: - Coalition of Tradefolk Underground
		#:: Grant a small amount of experience
		quest::exp(65);
		#:: Create a hash for storing cash - 350 to 400cp
		my %cash = plugin::RandomCash(350,400);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13268 - Complete Bug Collection
	elsif (plugin::takeItems(13268 => 1)) {
		quest::say("Oh you have a complete collection for me?! Good! Good! Well done. But remember that I need the complete bug collection and you must return my want list before I can pay you.");
		#:: Return the 13268 - Complete Bug Collection
		quest::summonitem(13268);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
