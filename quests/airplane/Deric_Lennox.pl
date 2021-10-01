sub EVENT_SPAWN {
	#:: Create a timer 'deric_depop' that triggers every 300 seconds (5 min)
	quest::settimer("deric_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'deric_depop'
	if ($timer eq "deric_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings there lad. Come seekin glory then have ya? Alrighty then, glorious ye shall be. Take me tests here, and I will show ya the light there. Take ye the Test of Resolution, of Theurgy, or the Weak?");
	}
	elsif ($text=~/resolution/i) {
		quest::say("The test of resolution be an easy one. Trust me there! Just needin bring me a Spiroc Stattuete, a Spiroc Healing Totem, and a Silvered Spiroc Necklace. Ne'r liked those birdies anyway.");
	}
	elsif ($text=~/theurgy/i) {
		quest::say("The test of Theurgy. Ne'r understood it meself. It calls fer you ta bring me an Efreeti Mace, a Saffron Spiroc Feather, a Glowing Sapphire, and a Djinni Aura.");
	}
	elsif ($text=~/weak/i) {
		quest::say("Aye, the weak. I laugh at 'em. Right after I put 'em in their places. Aye. Bring me there lad, a Efreeti Standard, a Manna Nectar, and a Shimmering Topaz. Yup, that'll do it.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20813 - Silvered Spiroc Necklace, a 20812 - Spiroc Healing Totem, and a 20954 - Spiroc Statuette
	if (plugin::takeItems(20813 => 1, 20812 => 1, 20954 => 1)) {				#:: Cleric Test of Resolution
		quest::say("Good on ya!");
		#:: Give a 14562 - Necklace of Resolution
		quest::summonitem(14562);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20815 - Djinni Aura, a 20816 - Efreeti Mace, a 20814 - Glowing Sapphire, and a 20961 - Saffron Spiroc Feather
	elsif (plugin::takeItems(20815 => 1, 20816 => 1, 20814 => 1, 20961 => 1)) {		#:: Cleric Test of Theurgy
		quest::say("Good on ya!");
		#:: Give a 27718 - Theurgist's Star
		quest::summonitem(27718);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20817 - Efreeti Standard, a 20968 - Manna Nectar, a 20819 - Mithril Bands, and a 20818 - Shimmering Topaz
	elsif (plugin::takeItems(20817 => 1, 20968 => 1, 20819 => 1, 20818 => 1)) {		#:: Cleric Test of the Weak
		quest::say("Good on ya!");
		#:: Give a 11691 - Truwian Baton
		quest::summonitem(11691);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
