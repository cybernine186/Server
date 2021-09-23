##Translocator_Gethia.pl
#Zone: butcher



if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_SPAWN{
		quest::settimer("depop",120); ##Despawn after 2 minutes
		quest::shout("The boat to the Ocean of Tears has arrived, please board quickly!");
	}
	sub EVENT_TIMER{
		quest::stoptimer("depop");
		quest::depop_withtimer();
	}
	sub EVENT_SAY{
	  if ($text=~/Hail/i){
	  quest::say("Hello there, $name. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to [" . quest::saylink("travel to the Timorous Deep") . "] in the meantime, I can transport you to my companion there.");
	  }
	  if($text=~/timorous deep/i)
	  {
	  quest::say("Off you go!");
	  quest::movepc(96,-3260.10,-4544.56,19.47); # Zone: timorous
	  }
	} 
}