sub EVENT_SPAWN {
	#:: Create a timer that loops every 360 seconds (6 min)
	quest::settimer("replenish",360);
	#:: Create a proximity, 100 units across, 100 units tall, and enable proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 1);
}	

sub EVENT_TIMER {
	#:: Match timer "replenish"
	if ($timer eq "replenish") {
		quest::say("Drawna.. Are we all out of bat fur again?");
		#:: Send a signal "1" to South Qeynos >> Drawna_Opimsor (1051) with no delay
		quest::signalwith(1051,1,0);
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Drawna_Opimsor.pl
	if ($signal == 1) {
		quest::say("Hmmm.. Let's see if we can find someone to help replenish our stock of [rat whiskers] and [bat fur]. I need these items for a new little experiment I'm working on.");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, and welcome to my humble little shop. I sell and trade various goods for my fellow wizards of the Order of Three. My assistants, Hanlore and Drawna, specialize in magicians' and enchanters' goods and would be glad to help you, too.");
	}
}

sub EVENT_PROXIMITY_SAY {
	if (($text=~/bat fur/i) || ($text=~/rat whiskers/i) || ($text=~/beetle eye/i)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("I need someone to gather up the three ingredients for a new spell I'm working on. I need some [rat whiskers], a [fire beetle eye], and a patch of [bat fur]. Thanks for helping me, young $name.");
		}
		else {
			quest::say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!");
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 13071 - Rat Whiskers, 13069 - Bat Fur, and 10307 - Fire Beetle Eye
	if (plugin::takeItems(13071 => 1, 13069 => 1, 10307 => 1)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::say("Hmm.. Good job, $name, let's give this a try.. Flame and fire.. Heat and spark.. Touch of Ro, light this dark!.. Ahh.. It stills needs a little work, I guess. Thanks for your help, here's a little something for your effort.");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(342, 5);		#:: + Order of Three
			quest::faction(221, -1);	#:: - Bloodsabers
			quest::faction(262, 1);		#:: + Guards of Qeynos
			quest::faction(296, -1);	#:: - Opal Dark Briar
			#:: Grant a small amount of experience
			quest::exp(500);
			#:: Create a hash for storing cash - 5 to 15cp
			my %cash = plugin::RandomCash(5,15);
			#:: Grant a random cash reward
			quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		}
		else {
			quest::say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!");
			#:: Return items 13071 - Rat Whiskers, 13069 - Bat Fur, and 10307 - Fire Beetle Eye
			quest::summonitem(13071);
			quest::summonitem(13069);
			quest::summonitem(10307);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
