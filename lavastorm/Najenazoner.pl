sub EVENT_SPAWN {
	quest::set_proximity($x - 15, $x + 20, $y - 40, $y + 40, $z - 40, $z + 40);
}

sub EVENT_ENTER {
	$client->MovePC(44, -413, -265, -112, 385);
}
