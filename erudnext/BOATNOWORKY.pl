sub EVENT_SPAWN
{
	quest::settimer("arrival", 370);
	quest::settimer("spawn", 500); #130
	quest::settimer("despawn", 520); #150
	quest::npcrace(127)
}
##arrives at the dock after 77 seconds
##leaves the dock after 108 seconds
##zones to qeynos after 120ish seconds
sub EVENT_TIMER
{
	if($timer eq "arrival")
	{
	quest::npcrace(73)
	}
	if($timer eq "spawn")
	{
	quest::spawn2(2000684,0,0,-1219,-247,-1,264); # NPC: Erudxingzoner;
	}
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}
