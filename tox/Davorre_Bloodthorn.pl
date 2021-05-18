sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings. Perhaps within that husk you call a body there is some worth? Are you [experienced] in your craft, young one, or are you a [neonate]?");
	}
	if ($text=~/neonate/i) {
		quest::say("Well then, child, I may still have a task for you. Will you [make use of] your pathetic cowardice, then, eh?");
	}
	if ($text=~/make use of/i) {
		quest::say("I see. This will not be the first time for you, I am sure. Take this list to Auhrik Siet`ka. His writing has become illegible in his old age, but he shall clarify what it is he needs you to do. Do as he says, child, and perhaps you will prove yourself a bit more worthy than the rotting flesh he will most likely have you return to him.");
		#:: Give a 14041 - Rolled Up Note
		quest::summonitem(14041);
	}
	if ($text=~/experienced/i) {
		quest::say("Ahhhh, a youth doth approach me with such confidence! That is to be commended in and of itself. Ordinarily, I would turn you away without a second glance, but perhaps you can be of some use. Tell me, child, are you [willing to assist] me in a small, yet important, task?");
	}
	if ($text=~/willing to assist/i) {
		quest::say("Good, child. Deliver this note to Veisha Fathomwalker. You shall find her patrolling the outer regions of Toxxulia Forest. I trust that you will keep your eyes to yourself in this matter. Now go, and please travel within the veil of night, so you will not be seen by those whose minds are still clouded with delusions of Erudin's grandeur.");
		#:: Give a 12998 - Rolled up Note
		quest::summonitem(12998);
	}
}

sub EVENT_ITEM {
	#:: Match a 12997 - Veisha's Engagement Ring
	if (plugin::check_handin(\%itemcount, 12997 => 1)) {
		quest::say("Only a few years have passed and her heart has already forgotten me. No doubt she has found another to warm her bed. Go, find her new lover, and bring me nothing less than his head.");
		#:: Set Factions
		quest::faction(265,5);	# + Heretics
		quest::faction(242,-5);	# - Deepwater Knights
		quest::faction(254,-5);	# - Gate Callers
		quest::faction(231,-5);	# - Craftkeepers
		quest::faction(233,-5);	# - Crimson Hands
	}
	#:: Match a 12996 - Phaeril Nightshire's Head
	if (plugin::check_handin(\%itemcount, 12996 => 1)) {
		quest::say("Apparently her choice in suitors has drifted to the most pathetic of wretches ever to slither Odus. You have done well, child. I ask of you one last task before my message to Veisha is complete. Here, deliver this to her with my most sincere regards.");
		#:: Give a 12995 - Locked Chest
		quest::summonitem(12995);
		#:: Set Factions
		quest::faction(265,5);	# + Heretics
		quest::faction(242,-5);	# - Deepwater Knights
		quest::faction(254,-5);	# - Gate Callers
		quest::faction(231,-5);	# - Craftkeepers
		quest::faction(233,-5);	# - Crimson Hands
	}
	#:: Match a 12994 - Veisha Fathomwalker's Head
	if (plugin::check_handin(\%itemcount, 12994 => 1)) {
		quest::say("My revenge has been satisfied. Thank you, my child. You have proven yourself to be a most worthy asset to our cause. Here, I no longer have any use for this, my ties to the old life are now severed.");
		#:: Give a 5526 - Battle Worn Halberd
		quest::summonitem(5526); #Battle Worn Halberd
		#:: Grant a moderate amount of experience
		quest::exp(6000);
		#:: Set Factions
		quest::faction(265,5);  # + Heretics
		quest::faction(242,-5);  # - Deepwater Knights
		quest::faction(254,-5); # - Gate Callers
		quest::faction(231,-5);  # - Craftkeepers
		quest::faction(233,-5);  # - Crimson Hands
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
