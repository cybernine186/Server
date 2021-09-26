# Voidd

sub EVENT_SPAWN {
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25, $z - 10, $z + 10);
}

sub EVENT_ENTER {
	quest::movepc(407, -8310 -3070 694 115); # Zone: highpasshold
}
