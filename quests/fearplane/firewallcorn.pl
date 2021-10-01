sub EVENT_SPAWN {
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100, $z - 2000, $z + 2000);
}

sub EVENT_ENTER {
	$npc->AddToHateList($client,1);
}

sub EVENT_COMBAT {
	if ($combat_state == 1) {
		quest::signalwith(72075, 4, 0);
		quest::signalwith(72015, 4, 0);
		quest::signalwith(72039, 4, 0);
		quest::signalwith(72081, 4, 0);
		quest::signalwith(72092, 4, 0);
		quest::signalwith(72075, 4, 0);
		quest::signalwith(72070, 4, 0);
	}
}