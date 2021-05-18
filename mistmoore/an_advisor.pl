sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::attack($name);
	}
}

sub EVENT_DEATH_COMPLETE {
	if (quest::is_the_ruins_of_kunark_enabled()) {
  quest::spawn2(59129,0,0,-176,91,-218,121); # NPC: Black_Dire
  }
}