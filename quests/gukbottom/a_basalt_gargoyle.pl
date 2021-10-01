sub EVENT_SPAWN {
	quest::settimer("anim", 5);
}

sub EVENT_TIMER {
	if ($timer eq "anim") {
		quest::stoptimer("anim");
		$npc->SetAppearance(1);
	}
}

