my $x;
my $y;
my $z;
my $h;

sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  if (quest::is_the_ruins_of_kunark_enabled()) {
  quest::spawn2(50322,0,0,$x,$y,$z,$h); # NPC: corrupted_hill_giant
  }
}