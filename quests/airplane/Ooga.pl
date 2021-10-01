sub EVENT_SPAWN {
	#:: Create a timer 'ooga_depop' that triggers every 300 seconds (5 min)
	quest::settimer("ooga_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'ooga_depop'
	if ($timer eq "ooga_depop") {
		quest::stoptimer("ooga_depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Euh? You come see Ooga about shaman tests? Me can test in shrink, the snake, or witch doctor! What yuz want to test in?");
	}
	elsif ($text=~/shrink/i) {
		quest::say("Ohh! Dat gud tes, me know cuz me did it. Me had get a Efreeti War Club, Djinni Statuette, sum Corrosive Venom an sum Wooden Bands. Was hard for Ooga, me took long to get dem. Yuz give all to me at sam time me give yuz what me got.");
	}
	elsif ($text=~/snake/i) {
		quest::say("Mmm, tes of snake not too bad, me did It an still alive. When me did It, me got Emerald Spiroc Feather, Bixie Essence, an Spiritualists Ring. Me get gud stuff for dat. Yuz giv me stuff all at once an me give to yuz what me got.");
	}
	elsif ($text=~/witch doctor/i) {
		quest::say("Oh! Now yuz got In da big mojo, me had big hard time wit dis one. Me got In lot of trouble when me got Efreeti War Maul, Thickened Nectar, Fire Sky Ruby an Symbol Of Veeshan. Yuz giv to me, Me be easy on yuz an giv prize me got.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20845 - Efreeti War Club, a 20955 - Djinni Statuette, a 20842 - Corrosive Venom, and a 20841 - Wooden Bands
	if (plugin::takeItems(20845 => 1, 20955 => 1, 20842 => 1, 20841 => 1)) {			#:: Shaman Test of Shrink
		quest::say("Take dis.");
		#:: Give a 27729 - Warhammer of the Wind
		quest::summonitem(27729);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20962 - Emerald Spiroc Feather, a 20843 - Bixie Essence, and a 20844 - Spiritualist`s Ring
	elsif (plugin::takeItems(20962 => 1, 20843 => 1, 20844 => 1)) {					#:: Shaman Test of the Snake
		quest::say("Take dis.");
		#:: Give a 27730 - Vermilion Sky Ring
		quest::summonitem(27730);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20846 - Efreeti War Maul, a 20969 - Thickened Nectar, a 20848 - Fire Sky Ruby, and a 20847 - Symbol of Veeshan
	elsif (plugin::takeItems(20846 => 1, 20969 => 1, 20848 => 1, 20847 => 1)) {			#:: Shaman Test of the Witch Doctor
		quest::say("Take dis.");
		#:: Give a 11694 - Garduk
		quest::summonitem(11694);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
