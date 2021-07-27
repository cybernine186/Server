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
    # 10% chance for Ivandyr's Hoop, 30% chance for Midnight Mallet, 60% for Brutechopper 
    my $roll_d10 = int(rand(10));
    if ($roll_d10 == 0){
      quest::summonitem(10082); # 10082 - Ivandyr's Hoop
    } elsif ($roll_d10 == 1 || $roll_d10 == 2 || $roll_d10 == 3) {
      quest::summonitem(10081); # 10081 - Midnight Mallet
    } else {
      quest::summonitem(10080); # 10080 - Brutechopper
    }
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
