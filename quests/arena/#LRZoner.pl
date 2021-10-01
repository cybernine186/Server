sub EVENT_SPAWN {
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40, $z - 60, $z + 60);
}

sub EVENT_ENTER {
	quest::movepc(51, 2643, 2419, 97);
}
