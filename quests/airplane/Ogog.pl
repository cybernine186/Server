sub EVENT_SPAWN {
	#:: Create a timer 'ogog_depop' that triggers in 300 seconds (5 min)
	quest::settimer("ogog_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'ogog_depop'
	if ($timer eq "ogog_depop") {
		quest::stoptimer("ogog_depop");
		quest::depop();
	}
} 

sub EVENT_SAY{
	if ($text=~/hail/i) {
		quest::say("Ogog not smart, but Ogog smarter than you.  You ready for Ogog or no?");
	}
	elsif ($text=~/ready/i) {
		quest::say("Ok, $name.  Ogog got some hard things for you.  You do bash, smash, or think test?");
	}
	elsif ($text=~/think/i) {
		quest::say("Ogog think you can do this one maybe, Ogog no know, though.  You bring Ogog efreeti belt, pegasus statue, a spiroc wind totem, and a wind tablet.  Ogog say good luck!");
	}
	elsif ($text=~/smash/i) {
		quest::say("Ogog smash good. . . Ogog no think you can smash good.  But Ogog let you try.  You get Ogog Djinni War Blade, some virulent wasp poison, and a mottled spiroc feather.  Ogog say you good warrior if you do this!");
	}
	elsif ($text=~/bash/i) {
		quest::say("This one hard, Ogog like it.  Ogog need efreeti battle axe, some honey nectar, bottled djinni, and ethereal emerald. Then Ogog make you best basher."); 
	}
}

sub EVENT_ITEM {
	#:: Match a 20983 - Efreeti Battle Axe, a 20963 - Honeyed Nectar, a 20981 - Bottled Djinni, and a 20982 - Ethereal Emerald
	if (plugin::takeItems(20983 => 1, 20963 => 1, 20981 => 1, 20982 => 1)) {			#:: Warrior Test of Bash
		quest::say("Yuz do good! Take dis!");
		#:: Give a 11675 - Fangol
		quest::summonitem(11675);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20980 - Djinni War Blade, a 20979 - Virulent Poison, and a 20956 - Mottled Spiroc Feather
	elsif (plugin::takeItems(20980 => 1, 20979 => 1, 20956 => 1)) {					#:: Warrior Test of Smash
		quest::say("Yuz do good! Take dis!");
		#:: Give a 11674 - Dagas
		quest::summonitem(11674);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20976 - Efreeti Belt, a 20949 - Pegasus Statuette, a 20977 - Spiroc Wind Totem, and a 20978 - Wind Tablet
	elsif (plugin::takeItems(20976 => 1, 20949 => 1, 20977 => 1, 20978 => 1)) {			#:: Warrior Test of Think
		quest::say("Yuz do good! Take dis!");
		#:: Give a 11673 - Belt of the Four Winds
		quest::summonitem(11673);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
