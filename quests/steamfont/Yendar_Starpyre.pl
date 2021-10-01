# Rogue Epic NPC -- Yendar_Starpyre
if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_SPAWN {
		quest::settimer("despawn",14400);
	}
	
	sub EVENT_SAY {
		if ($text=~/hail/i) {
			quest::say("Hail, traveler! I sense you did not simply chance upon my isolation here, but are instead seeking me for something.");
		}
		if ($text=~/translate/i) {
			quest::say("Oh, if it is written in Eder Teir'Dal, most likely I can translate it. I will be happy to try, in any case. Let me see it, please.");
		}
		if ($text=~/key/i) {
			quest::say("In the Plane of Hate, where dwell Innoruuk and his minions, there is a tome. This tome is called the Book of Souls.");
		}
		if ($text=~/book/i) {
			quest::say("The Book of Souls chronicles all the lives Innoruuk has tainted over the years. It is in the care of the Maestro of Rancor. I can use this tome as a basis for my translation, if you return it and the note to me. An experienced practitioner in the art of non-detection should be able to snatch it from its resting place, don't you think, $race?'");
		}
	}
	
	sub EVENT_ITEM {
		#Scribbled Parchment
		if ($itemcount{28053} == 1) {
			quest::say("I say, this is indeed a challenge. This is written in what I'm sure is the language of the High Priesthood of Innoruuk. I've often wished I could read this, but I have never had the key to unlock the language. Take this for now.");
			quest::ding();
			quest::exp(500);
			quest::summonitem(28055); #Tattered Parchment
			quest::stoptimer("despawn");
		}
		#Tattered Parchment, Book of Souls
		elsif (($itemcount{28055} == 1) && ($itemcount{28016} == 1)) {
			my $x = $npc->GetX();
			my $y = $npc->GetY();
			my $z = $npc->GetZ();
			my $h = $npc->GetHeading();
			quest::say("My, this is quite a large list! Yes, I can use the names and dates recorded here to help me understand the script. It should be a simple matter now. A moment, please. Aha, yes, there we go. Translated as best I can! I do hope you're not involved in what is described here, as it is quite fiendish. Oi! You, woman! Give that back! $name, that woman there took your letter! I think I should leave you to discuss it with her. Best of luck!.");
			quest::spawn2(56160,0,0,$x - 10,$y + 10,$z,$h); #Renux_Herkanor
			quest::depop();
		} else {
			quest::emote("will not accept this item.");
			plugin::return_items(\%itemcount);
		}
	}
	
	sub EVENT_TIMER {
		quest::stoptimer("despawn");
		quest::depop();
	}
}

#END of FILE  Quest by: Solid11  Zone:steamfont  ID:56012 -- Yendar_Starpyre