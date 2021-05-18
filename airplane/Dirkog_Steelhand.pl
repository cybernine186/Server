sub EVENT_SPAWN {
	#:: Create a timer 'dirkog_depop' that triggers every 300 seconds (5 min)
	quest::settimer("depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'dirkog_depop'
	if ($timer eq "dirkog_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Leave me be, ye orc kissin' son o' Innoruuk!");
	}
	elsif ($text=~/i am not a son of innoruuk/i) {
		quest::say("Eh? Ye say that ye ain't one o' the cursed dark elf dogs? Well then, laddie, are ye ready to get started or are ye here fer somethin' else??");
	}
	elsif ($text=~/holy swords/i) {
		quest::say("Eh, lad? What was that? Ye wish to hear o' holy swords? Well, lad, I ain't the one ye be needin' t' talk to!");
	}
	elsif ($text=~/who do I need to talk to/i) {
		quest::say("A follower o' the water god he be, an' one o' the most powerful holy knights e'er to walk Norrath. His name be Inte Akera, an' he kin tell ye what ye be wantin' t' know.");
	}
	elsif ($text=~/where is inte akera/i)  {
		quest::say("Ah, I see ye wish t' speak with him! Why didn't ye say that earlier, laddie? It would've saved ye some trouble! If ye wish to speak with him, ye must donate some spare change t' me ale.. er, t' me holy crusade fund! Well, lad, what d' ye say?");
	}
	elsif ($text=~/donate/i)  {
		quest::say("Eh? Oh, 500 platinum will be plenty, laddie!");
	}
	elsif ($text=~/ready to get started/i)  {
		quest::say("Well then! You best go out an get me a silvery girdle, a diaphanous globe, an a ivory sky diamond! Come on back with them and you'll get a nice belt.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20943 - Diaphanous Globe, a 20869 - Ivory Sky Diamond, and a 20868 - Silvery Girdle
	if (plugin::takeItems(20943 => 1, 20869 => 1, 20868 => 1)) {			#:: Paladin Test of Spirit
		quest::say("There ya go laddie!");
		#:: Give a 2716 - Girdle of Faith
		quest::summonitem(2716);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match five hundred platinum pieces
	elsif (plugin::takeCoin(0, 0, 0, 500)) {					#:: Paladin Epic 1.0
		quest::say("Thank ye, laddie! He's awaitin' ya up top!");
		#:: Spawn a The Plane of Sky >> Inte_Akera (71091), with no grid or guild war, at the specified coordinates
		quest::spawn2(71091, 0, 0, -586, 767, 176, 64);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
