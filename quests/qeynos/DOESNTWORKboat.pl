sub EVENT_SPAWN
{
	quest::settimer("spawn", 126);
	quest::settimer("despawn", 140);
}
##arrives at the dock after 67 seconds
##leaves the dock after 103 seconds
sub EVENT_TIMER
{
	if($timer eq "spawn")
	{
	quest::spawn2(2000680,0,0,392,345,2,264); # NPC: Erudxingzoner;
	}
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}
