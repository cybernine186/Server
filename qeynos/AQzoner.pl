sub EVENT_SPAWN {
	quest::set_proximity($x - 30, $x + 30, $y - 40, $y + 40, $z - 40, $z + 40);
}

sub EVENT_ENTER {
	$client->MovePC(45, 142, -175, -80, 385);
}
