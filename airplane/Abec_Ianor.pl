sub EVENT_SPAWN {
	#:: Create a timer 'abec_depop' that triggers every 300 seconds (5 min)
	quest::settimer("abec_depop", 300);
}

sub EVENT_TIMER {
	#:: Match timer 'abec_depop'
	if ($timer eq "abec_depop") {
		quest::stoptimer("abec_depop");
		#:: Depop without spawn timer active
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! Do you wish to begin your test of conception, visualization, or preparation?");
	}
	elsif ($text=~/conception/i) {
		quest::say("Conception is vital. Travel beyond and bring forth an Efreeti Statuette, a Mithril Air Ring, and a Box of Winds. From these I will produce a ring that will protect you where ever you go.");
	}
	elsif ($text=~/visualization/i) {
		quest::say("Visualize and succeed. Proceed upward and bring to me a White-Tipped Spiroc Feather, a Pulsating Sapphire, and an Amethyst Amulet. With these items, I will be able to produce an amulet that will aid in your travels to our home.");
	}
	elsif ($text=~/preparation/i) {
		quest::say("Always be prepared. Adventure and return an Efreeti War Staff, some Lush Nectar, a Copper Air Band, and a large Sky Sapphire and you shall be rewarded with the Staff of Storms.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20951 - Efreeti Statuette, a 20747 - Mithril Air Ring, and a 20748 - Box of Winds
	if (plugin::takeItems(20951 => 1, 20747 => 1, 20748 => 1)) {			#:: Wizard Test of Conception
		quest::say("Excellent! Take this.");
		#:: Give a 11686 - Solidate Mithril Ring
		quest::summonitem(11686);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
    		#:: Depop without spawn timer active
		quest::depop();
	}
	#:: Match a 20958 - White-tipped Spiroc Feather, a 20749 - Pulsating Sapphire, and a 20750 - Amethyst Amulet
	elsif (plugin::takeItems(20958 => 1, 20749 => 1, 20750 => 1)) {			#:: Wizard Test of Visualization
		quest::say("Excellent! Take this.");
		#:: Give a 14556 - Amulet of Planar Transference
		quest::summonitem(14556);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
    		#:: Depop without spawn timer active
		quest::depop();
	}
	#:: Match a 20753 - Efreeti War Staff, a 20965 - Lush Nectar, a 20751 - Copper Air Band, and a 20758 - Ivory Pendant
	elsif (plugin::takeItems(20753 => 1, 20965 => 1, 20751 => 1, 20758 => 1)) { 	#:: Wizard Test of Preparation
		quest::say("Excellent! Take this.");
		#:: Give a 11685 - Nargon's Staff
		quest::summonitem(11685);
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
