sub EVENT_SPAWN {
	#:: Create a timer 'alan_depop' that triggers every 300 seconds (5 min)
	quest::settimer("abec_depop", 300);
}

sub EVENT_TIMER {
	#:: Match timer 'alan_depop'
	if ($timer eq "alan_depop") {
		quest::stoptimer("abec_depop");
		#:: Depop without spawn timer active
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings faithful. Your faith shall be tested this day.  Shall you take the test of courage, skill, or protection?");
	}
	elsif ($text=~/courage/i) {
		quest::say("You have come seeking the knowledge and treasures that I posses. I will impart such things to you, if you do a service to your god. It matters not who that god may be, but the service and the faith you must exemplify. Bring to me an Ochre Tessera, a Sky Emerald, and a Silver Hoop.");
	}
	elsif ($text=~/skill/i) {
		quest::say("The test of skill it will be. Bring to me, a Gold Disc, a Dark Wood, and a Small Shield. You shall be rewarded upon your return.");
	}
	elsif ($text=~/protection/i) {
		quest::say("So, you must be a great protector to have ventured this far. Bring for me an Adumbrate Globe, a Glowing Diamond, and some Shiny Pauldrons for your reward.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20933 - Ochre Tessera, a 20807 - Silver Hoop, and a 20806 - Sky Emerald
	if (plugin::takeItems(20933 => 1, 20807 => 1, 20806 => 1)) { 			#:: Cleric Test of Courage
		quest::say("Wonderful! Take this as your reward!");
		#:: Give a 14563 - Truewind Earring
		quest::summonitem(14563);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		#:: Depop without spawn timer active
		quest::depop();
	}
	#:: Match a 20808 - Dark Wood, a 20939 - Gold Disc, and a 20809 - Small Shield
	elsif (plugin::takeItems(20808 => 1, 20939 => 1, 20809 => 1)) { 		#:: Cleric Test of Skill
		quest::say("Wonderful! Take this as your reward!");
		#:: Give a 27716 - Aegis of the Wind
		quest::summonitem(27716);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		#:: Depop without spawn timer active
		quest::depop();
	}
	#:: Match a 20946 - Adumbrate Globe, a 20829 - Glowing Diamond, and a2 0811 - Shiny Pauldrons
	elsif (plugin::takeItems(20946 => 1, 20829 => 1, 20811 => 1)) {			#:: Cleric Test of Protection
		quest::say("Wonderful! Take this as your reward!");
		#:: Give a 27717 - Pauldrons of Piety
		quest::summonitem(27717);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		#:: Depop without spawn timer active
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
