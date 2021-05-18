sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, enable proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 1);
	#:: Also, enable proximity say
	quest::enable_proximity_say();
}

sub EVENT_PROXIMITY_SAY {
	if ($text=~/gnolls/i) {
		quest::say("What was that you said? You mentioned the Sabertooths of Blackburrow? Those gnolls have caused this city trouble for too long. We have yet to force them from Qeynos Hills. I hear rumors of a few merchants who even dare to sell the outlawed Blackburrow Stout which is brewed by the gnolls. Foolish!! We call upon all citizens to assist in ridding our land of the gnolls. If you wish to join the fight, Captain Tillin is your man. Just say so.");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name! Lieutenant Arathur Swelnik at your service. I take great pride in keeping Qeynos safe and proper. I also try to bring the word of [Mithaniel Marr] to the people of this fine city.");
	}
	elsif ($text=~/mithaniel marr/i) {
		#:: Response made up
		quest::say("Mithaniel Marr is the Lord of Valor and my personal source of power and inspiration. You see I was orphaned as a small child and raised by the Priests of Marr in [Freeport]. I have dedicated my life to protecting the innocent. I now use the glorious powers that my faith in the Truthbringer has provided to help bring honor to the city of Qeynos.");
	}
	elsif ($text=~/freeport/i) {
		quest::say("Freeport is the city of my birth. It is not what it once was, though. Thugs and bandits patrol its streets. My comrades in the Knights of Truth have managed to protect the northern parts of the city but I fear they are outnumbered and will soon have to flee Freeport altogether. If it were not for my sworn duty here, I would join their noble [crusade].");
	}
	elsif ($text=~/crusade/i) {
		quest::say("The Knights of Truth fight a neverending battle against the corrupt and vicious Freeport Milita. If you are going to Freeport, you might want to meet up with Knight Rolius and let him know you are a [friend of Arathur]. They can always use another able body.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 12) {
		quest::say("Guard, stand up straight!");
		#:: Send a signal "1" to South Qeynos >> Guard_Jerith (1002) with no delay
		quest::signalwith(1002,1,0);
		#:: Send a signal "1" to South Qeynos >> Guard_Dunix (1181) with no delay
		quest::signalwith(1181,1,0);
	}
	elsif ($wp == 28) {
		quest::say("Guard, stand up straight!");
		#:: Send a signal "1" to South Qeynos >> Guard_Beren (1090) with no delay
		quest::signalwith(1090,1,0);
		#:: Send a signal "1" to South Qeynos >> Guard_Corshin (1091) with no delay
		quest::signalwith(1091,1,0);
	}
	elsif ($wp == 38) {
		quest::say("Guard, stand up straight!");
		#:: Send a signal "1" to South Qeynos >> Guard_Mezzt (1001) with no delay
		quest::signalwith(1001,1,0);
		#:: Send a signal "1" to South Qeynos >> Guard_Phaeton (1189) with no delay
		quest::signalwith(1189,1,0);
		#:: Send a signal "1" to South Qeynos >> Guard_Cyrillian (1006) with no delay
		quest::signalwith(1006,1,0);
		#:: Send a signal "1" to South Qeynos >> Guard_Forbly (1174) with no delay
		quest::signalwith(1189,1,0);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
