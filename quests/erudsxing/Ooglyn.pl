if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_SAY {
		if ($qglobals{'shmepic'} > 1) {
			if($text=~/hail/i) {
				quest::emote("Ooooh, it you, $name. Me's been waitin for you cuz our frenz say you comin an need da test. So's I gib you da test. Hmm, now where me put it? Ooglyn been waiting for sign for so long dat me forget where me put test. Keep your eyes out for sign while me look for test. Oh, hey, $name, they gib you gem? I need dat gem, please, heheh.");
			}
		} else {
			$reply1 = ("I didn't know Slime could speak common..go back to the sewer before I lose my temper.");
			$reply2 = ("Oh look..a talking lump of refuse..how novel");
			$reply3 = ("I wonder how much I could get for the tongue of a blithering fool..leave before I decide to find out for myself.");
			$reply4 = ("Is that your BREATH..or did something die in here..now go away!");
			$a = quest::ChooseRandom($reply1, $reply2, $reply3, $reply4);
			quest::say ($a);
		}
	}
	
	sub EVENT_ITEM {
		if ($itemcount{1666} == 1) {
			quest::say("Ahhh, tank you, now me can...OH LOOK!! DA SIGN!!!! Oh, sorry you missed it. The sign show you where to wait for da test. Follow me...I like you so I take you there. We goin for a swim, $name!");
			quest::moveto(4200.0,-1600.0,-287.3);
			$move = 1;
			if($qglobals{'shmepic'} <= 2) {
				quest::faction(342,10);
				quest::exp(10000);
				quest::setglobal("shmepic",3,5,'F');
			}
		} else {
			quest::emote("will not take this item.");
			plugin::return_items(\%itemcount);
			return;
		}
	}
	
	sub EVENT_WAYPOINT_ARRIVE {
		if($move == 1) {
			quest::say("Ok, here is place for you to for waiting. Hab fun shaman!");
			quest::spawn2(98046,0,0,4220.0,-1600.0,-287.3,0.0);
			quest::signalwith(98046,199,20000);
		}
	}
	
	sub EVENT_SIGNAL {
		if ($signal == 199) {
			quest::depop();
		}
		if ($signal == 99) {
			quest::resume();
		}
	 }
}