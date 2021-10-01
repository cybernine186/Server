sub EVENT_COMBAT {
	#:: Combat state true (enter combat)
	if ($combat_state == 1) {
		quest::say("Death awaits you my fool hardy friend.");
	}
}

sub EVENT_SLAY {
	quest::say("Another souless corpse to join my undead army. Hail Bertoxxulous!!");
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome to my field of decay. Won't you be so kind as to attack me? I have need of more bodies to join my diseased legion. Try it, maybe you shall win and gain my trusty [Pestilence].");
	}
	elsif ($text=~/pestilence/i) {
		quest::say("My beloved scythe. Upon my death, my soul shall live withn her. Such is the pact.");
	}
	elsif ($text=~/arlena/i) {
		quest::say("My beloved Arlena is my most perfect creation. A bit of flesh here, a bit of bone there and I created her. She left my arms while I was away. Find her and stop her. Return her bones to me so that I may restore her. She has no doubt returned to where I first met.. most.. of her, [Mistmoore Castle]!!");
	}
	elsif ($text=~/mistmoore castle/i) {
		quest::say("It stands on the continent of Faydwer. That is all you need to know.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12137 - Dwarf Skull
	if (plugin::takeItems(12137 => 1)) {
		quest::say("The head for my commander. Let us see. I have a body ready for it. There. Hahahaha!! As for your fine work, take this. Also, I believe you can help me find my beloved [Arlena].");
		#:: Give a random reward:  Raw-Hide Armor
		quest::summonitem(plugin::RandomRange(2137, 2148));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(221, 15);		#:: + Bloodsabers
		quest::faction(262, -2);		#:: - Guards of Qeynos
		quest::faction(296, 1);			#:: + Opal Darkbriar
		quest::faction(341, -3);		#:: - Priests of Life
		quest::faction(230, 1);			#:: + Corrupt Qeynos Guards
		#:: Create a hash for storing cash - 150 to 250cp
		my %cash = plugin::RandomCash(150,250);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("You have won this round, but my soul shall find it's way back to the Bloodsabers.");
}
