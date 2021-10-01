sub EVENT_SPAWN
{
	quest::settimer("arrival", 850);
	quest::settimer("spawn", 1020);
	quest::settimer("despawn", 1027);
	#quest::npcrace(127)
}

##takes 13 minutes and 51 seconds to get to where you should zone to freeport
sub EVENT_TIMER
{
	if($timer eq "arrival")
	{
	quest::npcrace(533)
	}
	if($timer eq "spawn")
	{
	quest::spawn2(2000655,0,0,10865,1320,15,264); # NPC: FREPzoner;
	}
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}
