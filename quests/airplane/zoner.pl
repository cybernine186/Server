sub EVENT_SPAWN {
	#:: Create a proximity, 5000 units across, 500 units tall, without proximity say
	quest::set_proximity($x - 2500, $x + 2500, $y - 2500, $y + 2500,$z - 300, $z + 200, 0);
}

sub EVENT_ENTER {
	#:: Move client to zone 10 - freporte, at the specified location
	quest::movepc(10, -1570, -25, 20, 231);
}
