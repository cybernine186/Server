sub EVENT_SPAWN {
	quest::settimer("TerrorShout", 17000);
	quest::settimer("TerrorDepop", 170000);
}

sub EVENT_TIMER {
	#:: Match timer TerrorShout
	if ($timer eq "TerrorShout") {
		quest::shout("Grrrraaaaarrrrrg! The stench of fear permeates the walls of this city! I will forge one item for the faithful of our Lord Cazic-Thule! Make haste!  My time here is short!");
	}
	#:: Match timer TerrorDepop
	if ($timer eq "TerrorDepop") {
		quest::depop();
	}
}

sub EVENT_ITEM {
	#:: Match a 14106 - Mundane Mask
	if (plugin::check_handin(\%itemcount, 14106 => 1)) {
		quest::say("Wear this mask imbued with my very essence. Wear it in honor of your great services to our Lord Cazic-Thule!");
		#:: Ding!
		quest::ding();
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Give a 14108 - Terror Forged Mask
		quest::summonitem(14108);
		#:: Set factions
		quest::faction(265,50);		# + Heretics
		quest::faction(254,-50);	# - Gate Callers
		quest::faction(242,-50);		# - Deepwater Knights
		quest::faction(231,-50);		# - Craftkeepers
		quest::faction(233,-50);		# - Crimson Hands
		#:: Despawn
		quest::depop();
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
