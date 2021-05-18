sub EVENT_SPAWN
{
	quest::settimer("despawn", 60); #280
}
##arrives at the dock after 150 seconds
##leaves the dock after 200 seconds
##zones to erudnext after 256 seconds
sub EVENT_TIMER
{
	if($timer eq "despawn")
	{
		$npc->Depop();
	}
}
