sub EVENT_SPAWN {
	#:: Create a timer 'inte_depop' that triggers every 300 seconds (5 min)
	quest::settimer("inte_depop", 300);
}

sub EVENT_TIMER {
	#:: Match timer 'inte_depop'
	if ($timer eq "inte_depop") {
		quest::stoptimer("inte_depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. I am Inte Akera. I have retired to the Plane of Sky after a long life toiling on Norrath's soil. Have you retreated here as well, or are you merely visiting?");
	}
	elsif ($text=~/toil/i) {
		quest::say("Long ago, before I came to this plane, I fought in the name of Prexus against all the evils that plagued Norrath. In that time, I have done everything one can do. I have fought for the causes of good. I gained the esteem of kings and lords. The sword I hold is but one example of the treasures I have sought and won. I have accomplished all that I can, have all that I desire. My toil is done and now I sit among the clouds in peace, occasionally blessing those who seek it and are found worthy.");
	}
	elsif ($text=~/blessing/i) {
		quest::say("Many come seeking my blessings. No matter how minor the blessing they ask, all must prove that they embody the qualities of a paladin before I bless them.");
	}
	elsif ($text=~/prove myself/i) {
		quest::say("I believe the two most important qualities of a paladin are nobility and sacrifice. Hand me an item of yours that proves you understand what nobility and sacrifice are. Be warned however, if I do not think as you do, I will simply accept the item as a gift, and give you no blessing.");
	}
	elsif ($text=~/nobility/i) {
		quest::say("Ah nobility. A true measure of a paladin. If you are wondering what to bring me, then perhaps you should look within yourself. Look into your soul for a great, burning fire of nobility and you will know.");
	}
	elsif ($text=~/sacrifice/i) {
		quest::say("Sacrifice is a virtue all paladins should strive for. The sacrifice of something dear to you will show your devotion. Perhaps something you use to smite the unholy undead.");
	}
	elsif ($text=~/accomplish/i) {
		quest::say("I accomplished many great deeds; far too many to name. I saved kings and kingdoms; I helped the weak and destitue; I accomplished all I sought to do, save one at which I failed.");
	}
	elsif ($text=~/failed/i) {
		quest::say("No.. I was unable to kill my most hated foe, Miragul. The head of this wretched, foul necromancer is forever out of the reach of justice. It would be worth restoring him to his former state for the chance to take his head as a trophy.");
	}
	elsif ($text=~/miragul/i) {
		quest::say("You think you can succeed where I cannot? Perhaps you can noble one.. Bring me the head of Miragul, his robe and hand me back the two blessings I gave you, and in return I shall bequeath to you this sword I carry. Good luck my friend.");
	}
}

sub EVENT_ITEM {
	#:: Match if faction is Ally
	if ($faction == 1) {
		#:: Match a 5504 - SoulFire
		if (plugin::takeItems(5504 => 1)) {
			quest::say("You have chosen wisely, my friend. Take this note as a token of my blessing upon you.");
			#:: Give a 18033 - Inte's First Blessing
			quest::summonitem(18033);
			#:: Ding!
			quest::ding();
			#:: Grant a huge amount of experience
			quest::exp(100000);
		}
		#:: Match a 5403 - Ghoulbane
		elsif (plugin::takeItems(5403 => 1)) {
			quest::say("You have chosen wisely, my friend. Take this note as a token of my blessing upon you.");
			#:: Give a 18034 - Inte's Second Blessing
			quest::summonitem(18034);
			#:: Ding!
			quest::ding();
			#:: Grant a huge amount of experience
			quest::exp(100000);
		}
		#:: Match a 18033 - Inte's First Blessing, a 18034 - Inte's Second Blessing, a 19073 - Miragul's Head, and a 1254 - Miragul's Robe
		elsif (plugin::takeItems(18033 => 1, 18034 => 1, 19073 => 1, 1254 => 1)) {
			quest::say("Long have I awaited this moment. You have done what even I thought impossible. Take this sword, the Fiery Avenger. You have earned both it and my deepest respect.");
			#:: Give a 11050 - Fiery Avenger
			quest::summonitem(11050);
			#:: Ding!
			quest::ding();
			#:: Grant a huge amount of experience
			quest::exp(1000000);
			quest::depop();
		}
		#:: Return unused items
		plugin::returnUnusedItems();
	}
	else {
		quest::say("I don't think I can trust you just yet...");
		#:: Return unused items
		plugin::returnUnusedItems();
	}
}
