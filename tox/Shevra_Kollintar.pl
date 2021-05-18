sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Unless you intend to [make] yourself useful, do not bother me.  I await the return of our Lord, Cazic-Thule.  He comes, and I shall be the first to greet Him.  I will train you, if need be, for He looks upon those who aid Him kindly.  If you are not here for training, return to your meditations or bother someone else.");
	}
	if ($text=~/make/i) {
		quest::say("One of our spies has reported a sighting of Malik Zaren, a courier of [the High Council].  He was seen resting at an inn called 'Golden Roosters' in High Pass Hold and is en route to Erudin Palace. He may be carrying a message containing information of great value to us.  Hunt him down and return to me with the letter he carries. I will reward you for this task.");
	}
	if ($text=~/the high council/i) {
		quest::say("The High Council is the governing board of Erudin, our sworn enemies.  Beware of these types, they will not look upon you warmly.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12270 - Sealed Letter
	if (plugin::check_handin(\%itemcount, 12270 => 1)) {
		quest::say("Ah, excellent work.  I certainly had my doubts about you, $name.  Wear this well.");
		#:: Ding!
		quest::ding();
		#:: Randomly give a 3040 - Blackened Iron Coif, 3042 - Blackened Iron Collar, 3043 - Blackened Iron Mail, 3044 - Blackened Iron Spaulder, 3046 - Blackened Iron Waistband, 3047 - Blackened Iron Armplates, 3048 - Blackened Iron Bracers, 3049 - Blackened Iron Gloves, 3050 - Blackened Iron Legplates, 3051 - Blackened Iron Boots
		quest::summonitem(quest::ChooseRandom(3040,3042,3043,3044,3046,3047,3048,3049,3050,3051));
		#:: Set factions
		quest::faction(265,5);	# + Heretics
		quest::faction(242,-5);	# - Deepwater Knights
		quest::faction(254,-5);	# - Gate Callers
		quest::faction(231,-5);	# - Craftkeepers
		quest::faction(233,-5);	# - Crimson Hands
		#:: Grant a small amount of experience
                quest::exp(250);
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
