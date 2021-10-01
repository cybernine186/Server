if(eq.is_the_ruins_of_kunark_enabled()){
	sub EVENT_SAY {
		if ($text=~/ancient hammer/i) {
			quest::say("Yes, the ancient hammer. I heard something about that. Do you mind if I take a look at it?");
		}
	}
	
	sub EVENT_ITEM {
		if ($itemcount{20478} == 1) {
			quest::emote("makes a few marks on the hammer, and all the while you can hear a muffled cursing coming from the hammer head. 'Yes, it is an ancient dwarf's hammer. Interesting artifact. I've marked it to keep it stable while you retrieve something for me. You need to travel to the Plane of Sky and find a swirling sphere of color. Bring it and the hammer back to me.'");
			quest::summonitem(20479);
		}
		elsif (($itemcount{20479} == 1) && ($itemcount{20494} == 1)) {
			quest::emote("holds the sphere and makes intricate marks and patterns on it, eventually turning the entire crystal clear. She rolls it across the hammer, raising a ringing sound in the room. 'There. Now take the hammer back to Kinlo. He'll know what to do from here. Good luck to you.'");
			quest::summonitem(20485);
		} else {
			quest::emote("will not accept this item.");
			plugin::return_items(\%itemcount);
		}
	}
}