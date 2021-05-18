sub EVENT_SPAWN {
	quest::settimer("follow", 10);
}

sub EVENT_TIMER {
	if ($timer eq "follow") {
		#:: 33066 - Blixkin_Entopop - (misty)
		my $OpponentID = 33066;
		my $getmobbynpctype = $entity_list->GetMobByNpcTypeID($OpponentID);
		my $follow_target = $getmobbynpctype->GetID();
		quest::follow($follow_target);
		quest::stoptimer("follow");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from /misty/Blixkin_Entopop.pl
	if ($signal == 1) {
		quest::emote("clicks at Blixkin happily.");
		#:: Send a signal '1' to Misty Thicket >> Blixkin_Entopop (33066) with no delay
		quest::signalwith(33066, 1, 0);
	}
}
