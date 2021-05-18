sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Most call me Gandari the Terse.  You here for [ivy armor]?");
	}
	elsif ($text=~/ivy armor/i) {
		quest::say("I reward brave rangers with ivy etched armor - [Helm]s. [Tunic]s. [Sleeves] and [Bracers]. [Interested]?");
	}
	elsif ($text=~/bracers/i) {
		quest::say("I do not haggle; I do not bargain. The Bottom of the Rune of Ivy from the plains of Everfrost, a Watery Ring from the Cauldron of Tears and a Fire Emerald to warm my heart. Bring these to me and you shall earn your reward.");
	}
	elsif ($text=~/helm/i) {
		quest::say("I do not haggle; I do not bargain. The top of the Rune of Ivy from Castle Mistmoore, a cyclops charm from Tarskuk and a sapphire of sky blue. Bring these to me and you shall earn your reward.");
	} 
	elsif ($text=~/sleeve/i) {
		quest::say("I do not haggle; I do not bargain. A heart of fire from the caverns of Solusek, the left side of the Rune of Ivy from the griffon Grimfeather and two star rubies of sparkling hue. Bring these to me and you shall earn your reward.");
	}
	elsif ($text=~/tunic/i) {
		quest::say("'I do not haggle; I do not bargain. The skull of Meldrath, the right side of the Rune of Ivy from the thistle brownie and two rubies of fiery red. Bring these to me and you shall earn your reward.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10569 - Rune of Ivy, a 10546 - Water Ring, and a 10033 - Fire Emerald
	if (plugin::takeItems(10569 => 1, 10546 => 1, 10033 => 1)) {
		quest::say("Well done. May Karana bless your soul.");
		#:: Give a 3189 - Ivy Etched Bracer
		quest::summonitem(3189);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(269, 10);	#:: + Kithicor Residents
		quest::faction(302, 1);		#:: + Protectors of Pine
		quest::faction(272, 1);		#:: + Jaggedpine Treefolk
		quest::faction(324, -1);	#:: - Unkempt Druids
		#:: Grant a large amount of experience
		quest::exp(10000);		
	}
	#:: Match a 10566 - Rune of Ivy, a 10570 - Cyclops Charm, and a 10034 - Sapphire
	elsif (plugin::takeItems(10566 => 1, 10570 => 1, 10034 => 1)) {
		quest::say("Well done. May Karana bless your soul.");
		#:: Give a 3181 - Ivy Etched Helm
		quest::summonitem(3181);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(269, 10);	#:: + Kithicor Residents
		quest::faction(302, 1);		#:: + Protectors of Pine
		quest::faction(272, 1);		#:: + Jaggedpine Treefolk
		quest::faction(324, -1);	#:: - Unkempt Druids
		#:: Grant a large amount of experience
		quest::exp(10000);
	}
	#:: Match a 10548 - Heart of Fire, a 10568 - Rune of Ivy, and two 10032 - Star Ruby
	elsif (plugin::takeItems(10548 => 1, 10568 => 1, 10032 => 2)) {
		quest::say("Well done. May Karana bless your soul.");
		#:: Give a 3188 - Ivy Etched Sleeves
		quest::summonitem(3188);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(269, 10);	#:: + Kithicor Residents
		quest::faction(302, 1);		#:: + Protectors of Pine
		quest::faction(272, 1);		#:: + Jaggedpine Treefolk
		quest::faction(324, -1);	#:: - Unkempt Druids
		#:: Grant a large amount of experience
		quest::exp(10000);		
	}
	#:: Match a 10571 - Skull of Meldrath, a 10567 - Rune of Ivy, and two 10035 - Ruby
	elsif (plugin::takeItems(10571 => 1, 10567 => 1, 10035 => 2)) {
		quest::say("Well done. May Karana bless your soul.");
		#:: Give a 3184 - Ivy Etched Tunic
		quest::summonitem(3184);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(269, 10);	#:: + Kithicor Residents
		quest::faction(302, 1);		#:: + Protectors of Pine
		quest::faction(272, 1);		#:: + Jaggedpine Treefolk
		quest::faction(324, -1);	#:: - Unkempt Druids
		#:: Grant a large amount of experience
		quest::exp(10000);
	} 
	#:: Return unused items
	plugin::returnUnusedItems();
}
