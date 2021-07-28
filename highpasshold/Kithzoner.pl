sub EVENT_SPAWN {
	quest::set_proximity($x - 10, $x + 10, $y - 40, $y + 40, $z - 40, $z + 40);
}

sub EVENT_ENTER {
	$client->MovePC(20, 4913.52, 532.07, 695, 131);
}
