my $counter;

sub EVENT_SPAWN {
	#:: Reset the count
	$counter = 0;
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from airplane/an_azarack.pl
	if ($signal == 1) {
		#:: Add 1 to the current count
		$counter += 1;
		if ($counter == 9) {
			#:: Spawn a The Plane of Sky >> Protector_of_Sky (71059), without grid or guild war, at the specified location
			quest::spawn2(71059, 0, 0, -602.2, -254.4, -333.5, 201.5);
			#:: Reset the counter
			$counter = 0;
		}
	}
	#:: Match a signal '2' from airplane/a_soul_carrier.pl
	elsif ($signal == 2) {
		#:: Key a data bucket
		$key = $npc->GetCleanName();
		#:: Match if the key does not exist
		if (!quest::get_data($key)) {
			#:: Set the data bucket to a value of '1' for 7200 seconds (120 minutes)
			quest::set_data($key, 1, 7200);
			#:: Create a timer 'keeper_spawn' that triggers every 3600 - 5100 seconds (60 to 85 minutes)
			quest::settimer("keeper_spawn", int(rand(1500)) + 3600);
		}
	}
}

sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Hello there, brave traveller. I sell keys that take you to other islands in this here Plane of Sky. My prices are the best around. Heh, heh.");
	}
}

sub EVENT_TIMER {
	#:: Match timer 'keeper_spawn'
	if ($timer eq "keeper_spawn") {
		#:: Spawn a The Plane of Sky >> Keeper_of_Souls (71075), without grid or guild war, at the specified location
		quest::spawn2(71075, 0, 0, -996.3, 910.5, 192.3, 18.0);
	}
}
