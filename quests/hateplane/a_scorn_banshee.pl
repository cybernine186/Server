my $x;
my $y;
my $z;
my $h;

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("You are almost beneath notice, but our master commands your death.");
	}
}

sub EVENT_SLAY {
	quest::emote("snorts in contempt, not at all surprised at the ease of her victory.");
}

sub EVENT_DEATH_COMPLETE {
	quest::emote("blinks in confusion, obviously surprised that she has met her end at the hands of mere mortals.");
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  $roll = int(rand(100));

	$roll_chance = $roll - 70;
	if($roll >= 95 and quest::is_the_ruins_of_kunark_enabled()) {
   quest::spawn2(186150,0,0,$x,$y,$z,$h); # NPC: Thought destroyer
	}
}
