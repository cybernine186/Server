# Voidd

sub EVENT_SPAWN {
	quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25, $z - 10, $z + 10);
}

sub EVENT_ENTER {
	quest::movepc(15, 105, 830, 5, 157); #Zl_eastkarana
}
