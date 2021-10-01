sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 30, $x + 30, $y - 30, $y + 30);
}

sub EVENT_ENTER
{
	$boat = 2000687;
	if ($entity_list->IsMobSpawnedByNpcTypeID($boat))
	{
		quest::movepc(24,-344,91,25); # Zone: erudnext
	}
}

sub EVENT_TIMER
{
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}