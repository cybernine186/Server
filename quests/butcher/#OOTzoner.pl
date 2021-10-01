sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 70, $x + 70, $y - 70, $y + 70);
	quest::settimer("despawn", 35);
}

sub EVENT_ENTER
{
	quest::movepc(69,-10715.860352,-1345.930054,-13); # Zone: oot
}

sub EVENT_TIMER
{
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}