sub EVENT_SPAWN {
	#:: Create a timer 'tynicon_depop' that triggers every 300 seconds (5 min)
	quest::settimer("tynicon_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'tynicon_depop'
	if ($timer eq "tynicon_depop") {
		quest::stoptimer("tynicon_depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! I offer to you four challenges. Disempowement, Envenoming, Raising of the Dead, or Necropotence. Choose one to be tested on.");
	}
	elsif ($text=~/disempowerment/i) {
		quest::say("Disempowerment, destroying good magic. Proceed upward through the sky and return to me a Griffon Statuette, a Blood Sky Emerald, and Rusted Pauldrons. This will prove your abilities to me and I will reward you with Blood Sky Face plate.");
	}
	elsif ($text=~/envenoming/i) {
		quest::say("Venom and hate permeates us more than our dumber, larger brohers. Return to me a Efreeti War Shield, a Dark Spiroc Feather, and an Obsidian shard and prove that your soul is envenomed with hatred. If you do so the Obtenebrate Mithril Guard shall be yours.");
	}
	elsif ($text=~/raising of the dead/i) {
		quest::say("The dead are our allies against those that would oppose us. Proceed upward through the sky and return to me a Large Sky Pearl, a Jar of Honey, a Sphinxian Ring, and Fae Pauldrons. This will prove your abilities to me and I will reward you with an Pearlescent Pauldrons.");
	}
	elsif ($text=~/necropotence/i) {
		quest::say("Only the most powerful and vile of shadow knights manage to complete this test. Return to me an Efreeti War Axe, some Dulcet Nectar, a Bloodstained Hilt, and a Blood Sky Ruby. Doing so will earn you the right to wield the Drinker of Blood.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20950 - Griffon Statuette, a 20703 - Blood Sky Emerald, and a 20704 - Rusted Pauldrons
	if (plugin::takeItems(20950 => 1, 20703 => 1, 20704 => 1)) {				#:: Shadowknight Test of Disempowerment
		quest::say("You have learned the ways of Disempowerment.");
		#:: Give a 4322 - Blood Sky Face Plate
		quest::summonitem(4322);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20705 - Efreeti War Shield, a 20957 - Dark Spiroc Feather, and a 20706 - Obsidian Shard
	elsif (plugin::takeItems(20705 => 1, 20957 => 1, 20706 => 1)) {				#:: Shadowknight Test of Envenoming
		quest::say("You soul is truly envenomed with hate.");
		#:: Give a 11678 - Obtenebrate Mithril Guard
		quest::summonitem(11678);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20707 - Large Sky Pearl, a 20708 - Jar of Honey, a 20709 - Sphinxian Ring, and a 20710 - Fae Pauldrons
	elsif (plugin::takeItems(20707 => 1, 20708 => 1, 20709 => 1, 20710 => 1)) {		#:: Shadowknight Test of Raising
		quest::say("You have proven your abilities.");
		#:: Give a 11699 - Pearlescent Pauldrons
		quest::summonitem(11699);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20711 - Efreeti War Axe, a 20964 - Dulcet Nectar, a 20713 - Blood Sky Ruby, and a 20712 - Bloodstained Hilt
	elsif (plugin::takeItems(20711 => 1, 20964 => 1, 20713 => 1, 20712 => 1)) {		#:: Shadowknight Test of Necropotence
		quest::say("You have truly earned this.");
		#:: Give a 11679 - Rheumguls
		quest::summonitem(11679);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
