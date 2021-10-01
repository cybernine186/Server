sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 150, $x + 150, $y - 150, $y + 150);
	quest::settimer("despawn", 25);
}

sub EVENT_ENTER
{
	quest::movepc(24,-1402,171,25); # Zone: erudnext
}

sub EVENT_TIMER
{
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}