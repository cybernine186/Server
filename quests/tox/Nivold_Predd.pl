sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("What do you want? Do not disturb me lest you plan to assist in my [summoning of Dread].");
	}
	if ($text=~/summoning of dread/i) {
		quest::say("There are some components essential to the summoning of the avatar of Dread. I require the eye of a griffon, some [powder of reanimation], the brain of the Ishva Mal, and the toes of an ice giant. Fetch me these reagents so that we may summon the avatar to forge a shield worn only by the mightiest apostles of Cazic-Thule.");
	}
	if ($text=~/powder of reanimation/i) {
		quest::say("There is a gnome necromancer who has been experimenting with a powder used in reanimating long dead organic tissue. He is known to frequent places populated by undead in order to pursue his research. Seek him out and procure a bit of his powder.");
	}
}

sub EVENT_ITEM {
	#:: Allow match if faction is indifferent or better
	if ($faction <= 5) {
		#:: Match 16540 - Ice Giant Toes, 13739 - Griffon Eye, 14111 - Brain of the Ishva Mal, 14112 - Powder of Reanimation
		if (plugin::check_handin(\%itemcount, 16540 => 1, 13739 => 1, 14111 => 1, 14112 => 1, )) {
			quest::say("Commendable work, you have proven yourself a valuable member of our order. Our chanters have summoned the avatar of Dread. Hurry and take him this mundane shield so that he may forge it into a truly valuable symbol of your devotion to the lord of Fear!");
			#:: Give a 14105 - Mundane Shield
			quest::summonitem(14105);
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
			#:: Spawn an avatar_of_dread (75164)
			quest::unique_spawn(75164,0,0,474,1230,-37,128);
		}
		else {
			quest::say("I require all four reagents, anything less is useless. Incompetence will get you nowhere amongst the faithful of Cazic-Thule!");
		}
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
