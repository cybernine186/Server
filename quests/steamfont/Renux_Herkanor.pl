# Rogue Epic NPC -- Renux_Herkanor

if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_SAY {
		if ($text=~/stanos is in highpass hold/i) {
			quest::say("Excellent. Stanos shall meet his end, and soon. You, however, will not live another day. Can't have you warning him, now can I?");
		}
	}
	
	sub EVENT_SPAWN {
		quest::settimer("despawn",1800); 
	}
	
	sub EVENT_ATTACK {
		quest::stoptimer("despawn");
	}
	
	sub EVENT_DEATH_COMPLETE {
		quest::say("Tell Hanns I tried, and will love him always. Tell Father I will save a seat in hell for him!");
	}
	 
	sub EVENT_TIMER {
		quest::stoptimer("despawn");
		quest::depop();
	}
}

#END of FILE  Quest by: Solid11  Zone:steamfont  ID:5088 -- Renux_Herkanor