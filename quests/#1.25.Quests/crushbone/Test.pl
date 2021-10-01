sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello, to change you nameplate colors use one, two, or three.");
	}
	elsif ($text=~/one/i) {
		quest::say("One...is Blue");
		$client->NamePlate(1);
	}
	elsif ($text=~/two/i) {
		quest::say("two...is Red");
		$client->NamePlate(2);
	}
		elsif ($text=~/three/i) {
		quest::say("Three...is Green");
		$client->NamePlate(3);
	}
}





