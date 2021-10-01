sub EVENT_SPAWN {
	quest::set_proximity($x - 15, $x + 15, $y - 40, $y + 40, $z - 40, $z + 40);
}

sub EVENT_ENTER {
	$client->MovePC(15, -8283.81, -3067, 693, 68);
}
