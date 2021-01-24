# Zone to OOT SirensBane event
# Zone: Butcher
# AngeloX

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 70, $x + 70, $y - 70, $y + 70);
}

sub EVENT_ENTER
{
	quest::movepc(69,-10715.860352,-1329.930054,2.0); # Zone: oot
}