sub EVENT_SPAWN
{
	quest::settimer("spawn", 145);
	quest::settimer("despawn", 155);
}


sub EVENT_TIMER
{
	if($timer eq "spawn")
	{
	quest::spawn2(2000652,0,0,3609,1630,19,264); # NPC: OOTzoner;
	}
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}
