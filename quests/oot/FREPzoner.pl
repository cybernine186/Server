sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 70, $x + 70, $y - 70, $y + 70);
	quest::settimer("despawn", 25);
}

sub EVENT_ENTER
{
	quest::movepc(10,-1328.38,305.68,-45); # Zone: freporte
}

sub EVENT_TIMER
{
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}