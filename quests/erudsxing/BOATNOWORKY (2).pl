sub EVENT_SPAWN
{
	quest::settimer("arrival", 125);
	quest::settimer("spawn", 370); #245
	quest::settimer("despawn", 385); #260
	quest::npcrace(127)
}
##arrives at the dock after 111 seconds
##leaves the dock after 150 seconds
##zones to erudnext after 247 seconds
sub EVENT_TIMER
{
	if($timer eq "arrival")
	{
	quest::npcrace(533)
	}
	if($timer eq "spawn")
	{
	quest::spawn2(2000682,0,0,-834,2150,0,264); # NPC: Erudzoner;
	}
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}
