# This is to spawn a lesser spirit upon the Capn's death for Shaman epic 1.0

sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  if (quest::is_the_ruins_of_kunark_enabled()) {
  quest::spawn2(69149,0,0,$x,$y,$z,$h); # NPC: a_lesser_spirit
  }
}


#Submitted by: Jim Mills