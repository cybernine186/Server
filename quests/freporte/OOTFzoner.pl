sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 70, $x + 70, $y - 70, $y + 70);
	quest::settimer("despawn", 35);
}

sub EVENT_ENTER
{
	quest::movepc(69,10861,1219,14); # Zone: freporte
}

sub EVENT_TIMER
{
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}