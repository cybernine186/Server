sub EVENT_SPAWN{
	quest::settimer("depop",120); ##Despawn after 2 minutes
	quest::shout("The boat to Butcherblock and Freeport has arrived, please board quickly!");
}
  
sub EVENT_TIMER{
	quest::stoptimer("depop");
	quest::depop_withtimer();
}

sub EVENT_SAY { 
  if ($text=~/Hail/i){
    quest::say("Hello there. There seems to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to [" . quest::saylink("travel to Freeport") . "] or [" . quest::saylink("travel to Butcherblock") . "] in the meantime, I can transport you to my companion there.");
  }
  if ($text=~/travel to freeport/i){
    quest::say("Off you go!");
	if(quest::is_prophecy_of_ro_enabled())
	{
		quest::movepc(382,-973,-121,4,353); # Zone: freporte
	} else {
		quest::movepc(10,-1006.66,-14.65,-53.47,383); # Zone: freporte
	}
  }
  if ($text=~/travel to butcherblock/i){
    quest::say("Off you go!");
    quest::movepc(68,3237,1355,14,128); # Zone: butcher
  }
}
