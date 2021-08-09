sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name! Are you a [citizen of Qeynos] or are you a [traveler of sorts]?");
	}
	elsif ($text=~/traveler of sorts/i) {
		quest::say("Ah, yes! Traveling can be truly dangerous. Have you ever been to [Erudin] or do you not care for that place?");
	}
	elsif ($text=~/erudin/i) {
		quest::say("The trip to Erudin takes far too long. I have been designing a [titanic bridge] which will shorten the trip. Well, I cannot take full credit, most of the plans are being designed by [three great engineers].");
	}
	elsif ($text=~/citizen of Qeynos/i) {
		quest::say("Then you are aware of how few ships come and go to the continent of Erudin. The port authority is even planning to tax all passage aboard the ships. You will be happy to know that a few other engineers and I are designing a [titanic bridge].");
	}
	elsif ($text=~/titanic bridge/i) {
		quest::say("My grand plan has always been to erect a bridge which would span the distance between Qeynos and Odus. It would bypass the city of Erudin. Antonius Bayle would take full control of the bridge and its adjacent territories. This has had some opposition in Erudin, but for the most part, they just believe it is impossible to build such a bridge.");
	}
	elsif ($text=~/three great engineers/i) {
		quest::say("They are some of the finest engineers in all of Norrath. Young, they may be, but as smart as the wisest architects I have ever met. That reminds me.. I must have a list of the engineers somewhere.. [Where is it]?");
	}
	elsif ($text=~/where is it/i) {
		quest::say("Do not concern yourself with the list. It is of no concern to you. I do not even have it. It is tucked away safely at home.");
	}
	elsif ($text=~/donation/i) {
		quest::say("I would be pleased to help out such a noble organization. Here you are, my good friend. See you at weekly services!");
		#:: Give a 13290 - A Donation (*Donation 1)
		quest::summonitem(13290);
	}
}

sub EVENT_WAYPOINT_DEPART {
	#:: Match if waypoint is 0 (spawn point)
	if ($wp == 0 ) {
		#:: Create a proximity, 20 units across, 20 units tall, without proximity say
		quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10, $z - 10, $z + 10, 0);
	}
	#:: Match if waypoint is 13
	elsif ($wp == 13) {
        	quest::clear_proximity
	        #:: Stop the timer "repeat"
		quest::stoptimer("repeat");
	}
	#:: Match if waypoint is 36
	elsif ($wp == 36) {
		quest::emote("picks up a discarded item from the ground.");
		quest::say("Don't people have enough respect for our grand city to not throw things onto the streets?!");
		#:: Set the timer "repeat" for every 320 seconds (5 minutes, 20 seconds)
		quest::settimer("repeat", 320);
	}
}

sub EVENT_ENTER {
	#:: Match when a client enters proximity
	$client->Message(15,"A note on the ground catches your eye.");
	#:: Give a 18835 - Sealed List
	quest::summonitem(18835);
	#:: Clear the NPC proximity setting
	quest::clear_proximity;
}
  

sub EVENT_TIMER {
	#:: Match the "repeat" timer
	if ($timer eq "repeat") {
		quest::emote("picks up a discarded item from the ground.");
		quest::say("Don't people have enough respect for our grand city to not throw things onto the streets?!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
