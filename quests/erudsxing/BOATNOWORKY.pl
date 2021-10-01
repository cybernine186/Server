sub EVENT_SPAWN
{
	quest::settimer("arrival", 500);
	quest::settimer("spawn", 766); #266
	quest::settimer("despawn", 780); #280
	quest::npcrace(127)
}
##arrives at the dock after 150 seconds
##leaves the dock after 200 seconds
##zones to erudnext after 256 seconds
sub EVENT_TIMER
{
	if($timer eq "arrival")
	{
	quest::npcrace(533)
	}
	if($timer eq "spawn")
	{
	quest::spawn2(2000686,0,0,372,-4338,-9,264); # NPC: Qeynoszoner;
	}
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}
