my $x;
my $y;
my $z;
my $h;

sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  $roll = int(rand(100));

	$roll_chance = $roll - 70;
	if($roll >= 50) {
   quest::spawn2(64092,0,0,$x,$y,$z,$h); # NPC: Swirlspine Guardian
	}
}