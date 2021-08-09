sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, and enable proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 1);
	#:: Create a timer that loops every 300 seconds (5 min)
	quest::settimer("fishing", 300);
}

sub EVENT_TIMER {
	#:: Match timer "fishing"
	if ($timer eq "fishing") {
		quest::say("Whoo!!! I think I got a bite! Darn.. Seaweed.");
	}
}

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Aaaaaa! Help! Guards! Psycho on the dock!");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Oh.. Hiya, I'm just out here fishing, since I can't find a job. I hope this [bait] I just bought catches me a big ol' fish.");
	}
	elsif ($text=~/bait/i) {
		quest::say("I use Captain Rohand's Secret Recipe Super Magic Catch-A-Lot brand bait. I bought my pole from Sneed's up by the north pond.");	
	}
}

sub EVENT_PROXIMITY_SAY {
	if ($text=~/tacklebox/i) {
		quest::say("Oh. That mean [dwarf], Trumpy, just knocked my tacklebox into the water. Could you please get it for me? I can't swim.");	
		#:: Send a signal "1" to South Qeynos >> Trumpy_Irontoe (1042) with no delay
		quest::signalwith(1042, 1, 0);
	}
	elsif ($text=~/dwarf/i) {
		quest::say("His name is Trumpy. He is one of those [Irontoes] I think. I've seen him hanging out in the Fish's Ale. I don't know why he likes to torment me.");
	}
	elsif ($text=~/irontoes/i) {
		quest::say("Ah! The Irontoes are a rough bunch of dwarves from Kaladim. The seem to get quite drunk on a frequent basis.");
	}
	elsif ($text=~/skippy/i) {
		quest::say("My name is not Skippy.");
	}
}

sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/Guard_Beren.pl
	if ($signal == 1) {
		quest::say("Oh, hi, Beren. Not too good so far. That [dwarf] keeps bothering me, too.");
		#:: Send a signal "2" to South Qeynos >> Guard_Beren (1090) with no delay
		quest::signalwith(1090, 2, 0);
	}
	#:: Match signal "2" from qeynos/Trumpy_Irontoe.pl
	elsif ($signal == 2) {
		quest::say("Huh? What? My [tacklebox]!? You know I can't swim, you rotten [dwarf]!");
		#:: Send a signal "1" to South Qeynos >> Trumpy_Irontoe (1042) with no delay
		quest::signalwith(1042, 1, 0);
	}
	#:: Match signal "3" from qeynos/Trumpy_Irontoe.pl
	elsif ($signal == 3) {
		quest::say("My name is not Skippy.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13702 - Wooden Fishing Tackle
	if (plugin::takeItems(13702 => 1)) {
		quest::say("Thank you so much!  If you want some free advice, steer clear of those [Irontoes]! They are nothing but trouble. Here, It's not much but I must thank you somehow.");
		#:: Give a 13129 - Hurrieta's Tunic
		quest::summonitem(13129);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(262, 10);		#:: + Guards of Qeynos
		quest::faction(219, 1);			#:: + Antonius Bayle
		quest::faction(230, -1);		#:: - Corrupt Qeynos Guards
		quest::faction(223, -2);		#:: - Circle of Unseen Hands
		quest::faction(291, 1);			#:: + Merchants of Qeynos
		#:: Grant a small amount of experience based on level
		$client->AddLevelBasedExp(5, 1);
		#:: Create a hash for storing cash - 5 to 20cp
		my %cash = plugin::RandomCash(5,20);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
