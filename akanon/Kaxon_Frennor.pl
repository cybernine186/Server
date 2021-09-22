sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hail."); }
}

sub EVENT_ITEM { 
 if (plugin::check_handin(\%itemcount, 18705 => 1)){
	quest::say("Thanks.");
	quest::summonitem("13518");
	quest::exp("100");
	} else {
		plugin::traindiscs();
		plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:akanon  ID:55159 -- Kaxon_Frennor 

