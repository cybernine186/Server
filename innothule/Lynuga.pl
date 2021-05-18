sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hrrump?! Who you? $name? What you want with Lynuga? Me am out [collecting]. Leave me be!");
	}
	elsif ($text=~/collecting/i) {
		quest::say("I collect all sort's of thing's. Gem's be my favorite. Me really like rubies. If you have ruby, give to me! Why you want to know? You want to steal my collection?!? I squish you if you do!!");
	}
	elsif ($text=~/happy love bracers/i) {
		quest::say("Happy love bracers! Dem ugly tings! Me gave dem to old flame in Neriak. Him old news now. Me let him keep dem ugly green tings.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10035 - Ruby
	if (plugin::takeItems(10035 => 1)) {
		quest::say("Mmm. Ruby!! Me thank's you! Here take this, me got it off dead someone who try take my collection. Me think's this valuable thing..");
		#:: Give a random reward: 10080 - Brutechopper, 10081 - Midnight Mallet, 10082 - Ivandyr's Hoop
		quest::summonitem(quest::ChooseRandom(10080, 10081, 10082));
		#:: Ding!
		quest::ding();
		quest::faction(222, 5);			#:: + Broken Skull Clan
		quest::faction(308, -5);		#:: - Shadowknights of Night Keep
		quest::faction(235, -5);		#:: - DaBashers
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
