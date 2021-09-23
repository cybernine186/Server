sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail. $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
	}
	elsif ($text=~/interested/i) {
		quest::say("I have messages that need to go to - well. right now I have one that needs to go to Kelethin.  Will you [deliver] mail to Kelethin for me?");
	}
	elsif ($text=~/mail/i) {
		quest::say("The League of Antonican Bards has a courier system made up of travelers, adventurers, and agents.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?");
	}
	elsif ($text=~/deliver/i) {
		quest::say("Take this letter to Jakum Webdancer. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
		#:: Give a 18160 - Bardic Letter (Kelethin)
		quest::summonitem(18160);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
