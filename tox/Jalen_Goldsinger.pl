sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say("A fine day.  Quite murky and quiet, is it not? May your path be filled with fortunes. Be well.");
	}
	if ($text=~/crystal of capturing/i) {
		quest::say("Hrm? A crystal of capturing?  Aye.  I do know the secret of their making. Not that I would tell you. I will, however, create one for you. Provided you bring me some of their componenents and a large coin reserve, that is.  I require a potion of sorrow and 1000 gold coins.  A tidy sum, in return for which, I will do you the favor of not asking why you need such a... dark item.");
	}
}

sub EVENT_ITEM {
 	#:: Match if cash is greater than 1000 gp and for a 7113 - Potion of Sorrow
	if (plugin::check_handin(\%itemcount, 7113 => 1) && $gold >= 1000) {
		quest::say("Excuse me while I add some other items to this mix.  There. Finished. Here you go, and thank you for your business.");			#:: Grant a small amount of experience
		quest::exp(1250);
		#:: Give a 7112 - Empty Crystal Sphere
		quest::summonitem(7112);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(254,1);	# + Gate Callers
		quest::faction(266,1);	# + High Council of Erudin
		quest::faction(267,1);	# + High Guard of Erudin
		quest::faction(265,-1);	# - Heretics
	}
	else {
		#:: Return unused money
		quest::givecash($copper, $silver, $gold, $platinum);
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
