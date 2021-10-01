sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the [summoning of Terror].");
	}
	if ($text=~/summoning of terror/i) {
		quest::say("It will be a frightfully fulfilling summons. To do this, I need an eye of urd, some basalt drake scales, the lens of Lord Soptyvr, and a lock of widowmistress hair.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10523 - Eye of Urd, 19032 - Basalt Drake Scales, 14110 - Lens of Lord Soptyvr, 14109 - Widowmistress Hair
	if (plugin::check_handin(\%itemcount, 10523 => 1, 19032 => 1, 14110 => 1, 14109 => 1)) {
		quest::say("Yes, this is what I require to summon Terror!"); #Text made up
		quest::emote("begins speaking an incantation. 'Our chanters have summoned the Avatar of Terror. Take him this mundane mask so that he may forge it into a truly valuable symbol of your devotion to the lord of Fear!'");
		#:: Give a 14106 - Mundane Mask
		quest::summonitem(14106);
		#:: Ding!
		quest::ding();
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 1111 to 9999cp
		my %cash = plugin::RandomCash(1111,9999);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Set factions
		quest::faction(265,400);	# + Heretics
		quest::faction(254,-400);	# - Gate Callers
		quest::faction(242,-400);	# - Deepwater Knights
		quest::faction(231,-400);	# - Craftkeepers
		quest::faction(233,-400);	# - Crimson Hands
		#:: Spawn an avatar_of_terror (75165)
		quest::unique_spawn(75165,0,0,474,1230,-37,128);
	}
	#:: Return unused items
	plugin::returnitems(\%itemcount);
}
