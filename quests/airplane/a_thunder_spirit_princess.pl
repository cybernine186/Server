sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, travelers, welcome to the Plane of Sky! We are thunder spirits - this first island is our home. You are welcome to stay here as long as you like. If you wish to go to other islands you may purchase keys from the Key Master.");
	}
#::	#:: Necromancer Epic 1.0
#::	elsif ($text=~/gkzzallk/i) {
#::		quest::say("Gkzzallk lives far above here. We often take him tea because he's so nice to us fairies! He likes to chat with the others who live here and can often be found in the temple up above. If you give me a bit of money, I can go make sure he is home.");
#::	}
}

sub EVENT_ITEM {
#::	#:: Necromancer Epic 1.0
#::	if ($gold == 10) {
#::		quest::say("Thank you, $name. I will tell him to expect visitors.");
#::		quest::spawn2(71073,0,0,287.9,662.5,-54.1,109.3);
#::		quest::depop();
#::	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	#:: Key a data bucket
	$key = sirran_status;
	#:: Set a value of '1' for 900 seconds (15 min)
	quest::set_data($key, "1", 900);
	#:: Spawn one and only one The Plane of Sky >> Sirran_the_Lunatic (71058), without grid or guild war, at the current location
	quest::unique_spawn(71058, 0, 0, $x, $y, $z);
}
