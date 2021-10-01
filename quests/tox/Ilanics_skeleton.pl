sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("My scroll must find my [scroll] so I may finish my research.");
	}
	elsif ($text=~/scroll/i) {
		quest::say("Kobold! Kobold!");
		#:: Spawn one and only one Toxxulia Forest >> a_kobold_caster (38172), no guildwar or pathing grid, offset from current position
		quest::unique_spawn(38172, 0, 0, $x+5, $y-2, $z, $h);
		#:: Depop with spawn timer active
		quest::depop_withtimer();
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
