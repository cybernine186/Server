sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("A skeleton's day is never done.");
		quest::say("Yo ho. No sun!");
		#:: Send a signal '1' to Toxxulia Forest >> abandoned_heretic_pet (38139) with no delay
		quest::signalwith(38139, 1, 0);
	}
}

sub EVENT_ITEM {
	#:: Match 13894 - Useless Cloth Cap
	if (plugin::takeItems(13894 => 1)) {
		quest::say("Aye.. You cut out the middleman..  I shall reward you.. hmm..  I have not found anything. how about..  <CRACK!! SNAP!! RIPP!!>  How about something off meself?");
		#:: Give a random reward: 9304 - Bone Shield, 12195 - Fractured Femur, 13073 - Bone Chips, 13074 - Zombie Skin
		quest::summonitem(quest::ChooseRandom(9304,12195,13073,13074)); 
		#:: Ding!
		quest::ding();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from tox/abandoned_heretic_pet.pl
	if ($signal == 1) {
		quest::say("We are not your pets!");
		quest::say("We will speed up when you return our mining caps. There are falling rocks all over this place! We could get killed!");
	}
}

