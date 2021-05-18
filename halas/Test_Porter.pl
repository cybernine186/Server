sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say ("hail, if you would like to port to the following zones simply say the zones full name (East Commonlands, South Ro, Steamfont, Lavastorm, Toxxulia Forest, or North Karana)!");
	}
	if ($text=~/East Commonlands/i) {
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->MovePC(22, -225, -1542, 3, 376);
	}
	if ($text=~/South Ro/i) {
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->MovePC(35, 316, -2038, -22, 40);
	}
	if ($text=~/Steamfont/i) {
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->MovePC(56, 1675, -1789, -108, 139);
	}
	if ($text=~/Lavastorm/i) {
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->MovePC(27, 1318, 1001, 123, 398);
	}
	if ($text=~/North Karana/i) {
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->MovePC(13, -999, -2787, 19, 392);
	}
	if ($text=~/Toxxulia Forest/i) {
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->MovePC(38, -325, 1049, -54, 116);
	}
}
