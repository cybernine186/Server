sub EVENT_SAY {
	if ($text=~/understand common/i) {
		quest::say("Of course you do. Now, listen carefully. It may be too much for your feeble mind to gather all at once, and I hate to repeat myself. Bring me one bat wing, one rat ear, one snake egg, and one fire beetle eye. Take this bag, and make sure it's sealed before you return it to me. Snake eggs spoil. Now, quit staring at me with your jaw hanging open like a dead codfish. I would have mistaken you for one, but dead codfish smell better. Haha!");
		#:: Give a 17802 - Small Sealable Bag
		quest::summonitem(17802);
	}
}

sub EVENT_ITEM {
	#:: Match a 14041 - Rolled Up Note
	if (plugin::check_handin(\%itemcount, 14041 => 1)) {
		quest::say("Why are you giving this to me? Oh I see. I forgot that rats don't know how to read. Haha! Well, then. I shall read it for you. You do [understand common] don't you? Haha.");
	}
	#:: Match a 12993 - Small Sealed Bag
	if (plugin::check_handin(\%itemcount, 12993 => 1)) {
		quest::say("My revenge has been satisfied. Thank you, my child. You have proven yourself to be a most worthy asset to our cause. Here, I no longer have any use for this, my ties to the old life are now severed.");
		#:: Ding!
		quest::ding();
		#:: Give a moderate amount of experience
		quest::exp(2000);
		#:: Create a hash for storing cash - 30 to 50cp
		my %cash = plugin::RandomCash(30,50);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Set factions
		quest::faction(265,5);	#:: + Heretics
		quest::faction(242,-5);	#:: - Deepwater Knights
		quest::faction(254,-5);	#:: - Gate Callers
		quest::faction(231,-5);	#:: - Craftkeepers
		quest::faction(233,-5);	#:: - Crimson Hands
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
