my $Listener = 0;

sub EVENT_SPAWN {
	#:: Create a proximity, 80 units across, 20 units tall, without proximity say
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40, $z - 10, $z + 10, 0);
}

sub EVENT_ENTER {
	$Listener = 1;
}

sub EVENT_EXIT {
	$Listener = 0;
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from /highkeep/Isabella_Cellus.pl
	if ($signal == 1) {
		if ($Listener == 1) {
			quest::say("Welcome Lady Isabella. You are always welcome at this table. As for your friend..");
			#:: Send a signal '1' to High Keep >> Isabella_Cellus (6082) with no delay
			quest::signalwith(6082, 1, 0);
			#:: Send a signal '1' to High Keep >> Isabella_Cellus (6092) with no delay
			quest::signalwith(6092, 1, 0);
			#:: Send a signal '1' to High Keep >> Isabella_Cellus (6167) with no delay
			quest::signalwith(6167, 1, 0);
		}
		else {
			quest::say("Welcome Lady Isabella. You are always welcome at this table.");
		}
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name! I am sorry but this table has a hundred platinum minimum. Maybe you should start on the copper tables.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
