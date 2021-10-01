sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::emote("turns its head towards you, a small shower of sparks dance accross the ground and you detect the faint smell of something burning.");
		quest::say("Greetings, lost soul. I am a guide, automaton series G. I can assist you by leading you to all the important destinations in Ak'Anon. All you need to do is ask 'where' and state a valid destination. ..Bzzz.. Click.. Grind.. Grind..  This Unit is Out of Order! Click.. Grind..");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::return_items(\%itemcount);
}

#converted to Perl by SS
