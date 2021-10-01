sub EVENT_SPAWN {
	#:: Create a timer 'gregori_depop' that triggers every 300 seconds (5 min)
	quest::settimer("gregori_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'gregori_depop'
	if ($timer eq "gregori_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("As I said before, the test of the heart is in three parts.  Compassion, Sacrifice and Love. Choose one and we will begin.");
	}
	elsif ($text=~/compassion/i) {
		quest::say("Compassion is of great importance to us. Without it, we do not feel empathy, and cannot truly follow the path we claim to travel. Return to me an Efreeti zweihander, dulcet nectar, a golden hilt, and a large sky diamond. If you present these to me, I will award you Truvinan, the divine wind.");
	}
	elsif ($text=~/sacrifice/i) {
		quest::say("You have sacrificed much to come so far Erudite. Sacrifice this one last time and the sword of ocean breeze shall be yours. Retrieve a griffon statuette, a spiroc peace totem, and a bixie sword blade.");
	}
	elsif ($text=~/love/i) {
		quest::say("Love is what makes us close to the gods we follow. Without it, we could not truly worship them, and would be lost. Prove yourself to me and return with a dark spiroc feather, ethereal topaz, and a sphinx claw.  In return I will give you Zephyrwind.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20725 - Efreeti Zweihander, a 20964 - Dulcet Nectar, a 20726 - Golden Hilt, and a 20727 - Large Sky Diamond
	if (plugin::takeItems(20725 => 1, 20964 => 1, 20726 => 1, 20727 => 1)) {			#:: Paladin Test of Compassion
		quest::say("Truvinan is now yours, $name. I pray that you use the Divine Wind wisely.");
		#:: Give a 11682 - Truvinan
		quest::summonitem(11682);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20950 - Griffon Statuette, a 20721 - Spiroc Peace Totem, and a 20722 - Bixie Sword Blade
	elsif (plugin::takeItems(20950 => 1, 20721 => 1, 20722 => 1)) {					#:: Paladin Test of Sacrifice
		quest::say("Rare is it to see one such as yourself go so far. Wield Aldryn with pride, $name, and know that you are perhaps unique among your peers.");
		#:: Give a 27708 - Aldryn, Blade of the Ocean
		quest::summonitem(27708);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20957 - Dark Spiroc Feather, a 20723 - Ethereal Topaz, and a 20724 - Sphinx Claw
	elsif (plugin::takeItems(20957 => 1, 20723 => 1, 20724 => 1)) {					#:: Paladin Test of Love
		quest::say("You are indeed worthy of this divine sword, $name. As long as you wield Zephyrwind, you will follow the true path.");
		#:: Give a 11681 - Zephyrwind
		quest::summonitem(11681);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
