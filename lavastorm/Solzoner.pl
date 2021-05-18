sub EVENT_SPAWN {
	quest::set_proximity($x - 7, $x + 7, $y - 15, $y + 15, $z - 15, $z + 15);
}

sub EVENT_ENTER {
	$client->MovePC(80, 57.24, 260.79, 2.75, 384.5);
}
