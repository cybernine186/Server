sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 2
	if ($wp == 2) {
		quest::emote("stumbles and says, 'Hey fools.  Blackburrow stout for sale five gold.  Load up now 'cause it's going fast!  Just make sure you enjoy it in privacy or you might get arrested, ha haaaa!'");
	}
	#:: Matcy waypoint 3
	elsif ($wp == 3) {
		quest::emote("burps loudly and says, 'Your loss.  Back to the bridge I go to keep us safe from the enemy or whatever it is I'm supposed to be doing out there.'");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hey, hey! I have some Blackburrow Stout for sale. Just hand over five gold and I'll give you a bottle of it. Don't get caught though because it is considered [contraband]. [Antonius] don't like it being smuggled and all that but what does he know, anyway?");
	}
	elsif ($text=~/contraband/i) {
		quest::say("Well it's brewed by gnolls, ya know. Don't know exactly why it's considered contraband but I think it's because they use the money they get from selling the stout to buy arms. I dunno. I buy low and sell high. Blackburrow Stout is good for you though! It does wonders for me! Now buy some already before someone hears us talking.");
	}
	elsif ($text=~/antonius/i) {
		quest::say("That man is as clueless as a froglok tad swimming in a keg of dwarven ale! He has no idea what is going on around him. He won't be around for much longer I wager.");
	}
}

sub EVENT_ITEM {
	#:: Match 5 gold pieces
	if (plugin::takeCoin(0, 0, 5, 0)) {
		#:: Need dubious or better faction with Corrupt Qeynos Guards
		if ($faction <= 7) {
			quest::say("There you go, sport. If you get caught with that, you didn't get it from me!");
			#:: Give a 13107 - Black Burrow Stout
			quest::summonitem(13107);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
			quest::faction(262, -1);	#:: - Guards of Qeynos
			quest::faction(273, 1);		#:: + Kane Bayle
			quest::faction(223, 1);		#:: + Circle Of Unseen Hands
			quest::faction(221, 1);		#:: + Bloodsabers
		}
		else {
			quest::say("You have the smell of a snitch. I have nothing for you to purchase");
			#:: Return the 5 gold
			quest::givecash(0,0,5,0);
		}
		
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
