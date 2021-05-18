sub EVENT_SPAWN {
	quest::set_proximity($x - 20, $x + 20, $y - 40, $y + 40, $z - 40, $z + 40);
}

sub EVENT_ENTER {
	$client->MovePC(407, 137.28, 818.18, 3.75, 129);
}
