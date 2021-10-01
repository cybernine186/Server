sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("It is about time I met up with someone who I can tolerate.  Most of the residents within these plains shun gnomes.  I will happy to leave if I could just find those [pesky skeletons].");
	}
	elsif ($text=~/pesky skeletons/i) {
		quest::say("I was sent here by the Gemchoppers to seek out a pocketful of skeletons.  They are a creation of a one of Ak'Anon's exiled citizens.  He practiced the dark circle of magic and came to find the necromancers of Antonica.  He created and imported undead brownies to this realm.  We must find them to study them.  I can't seem to find them!!  If only I could find a [brave fighter] to assist me.");
	}
	elsif ($text=~/brave fighter/i) {
		#:: Faction hit
		quest::faction(255, -10);		#:: - Gem Choppers
		quest::say("Very good. Take this tin box.  Fill each slot with the remains of the tiny undead, should you find them here.  I know not how many there exists, but I am sure that if I return this full tin box shall suffice.  Be quick, I have other matters to to tend to.  I shall depart when next my sun dial points to eight.");
		#:: Give a 17986 - Empty Tin Box
		quest::summonitem(17986);
		#:: Call the sub routine to spawn a_tiny_skeleton (13120)
		SpawnSkells();
	}
}

sub EVENT_ITEM {
	#:: Match a 12376 - Box Full of Tiny Bones
	if (plugin::takeItems(12376 => 1)) {
		quest::say("Good Work. Unfortunately, I must investigate other matters in the name of Ak'anon.  Here.  You deliver the tin box to Lord Jenork of the Gem Choppers.  He shall reward you. Be safe my friend.  I must go now. Farewell.");
		#:: Give a 12378 - Box of Undead Brownie Bones
		quest::summonitem(12378);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 10);		#:: + Gem Choppers
		quest::faction(288, 2);			#:: + Merchants of Ak`Anon
		quest::faction(333, 2);			#:: + King Ak`Anon
		quest::faction(238, -2);		#:: - Dark Reflection
		quest::faction(1604, -1);		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Depop with spawn timer active
		quest::depop_withtimer();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub SpawnSkells {
	#:: Spawn The Northern Plains of Karana >> a_tiny_skeleton (13120) on grid 106
	quest::spawn2(13120, 106, 0, -1839, 829, 18, 0); 
	quest::spawn2(13120, 106, 0, -2149, 1351, 18, 0);
	quest::spawn2(13120, 106, 0, -1713, 1075, 17, 0);
	quest::spawn2(13120, 106, 0, -1690, 363, -7, 0);
	quest::spawn2(13120, 106, 0, -2604, 222, -44, 0);
	quest::spawn2(13120, 106, 0, -1849, 839, 18, 0); 
	quest::spawn2(13120, 106, 0, -2249, 1351, 18, 0);
	quest::spawn2(13120, 106, 0, -1813, 1075, 9, 0);
	quest::spawn2(13120, 106, 0, -1690, 463, -7, 0);
	quest::spawn2(13120, 106, 0, -2604, 422, -38, 0);
}
