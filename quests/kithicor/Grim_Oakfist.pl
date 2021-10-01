sub EVENT_SAY {
	if ($text=~/hail/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("It is good to finally meet one who respects the disciplines of the Ashen Order.  All I have met are rangers.  They have interfered with my [mission in the woods].");
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
		else {
			quest::say("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.");
		}
	}
        elsif ($text=~/mission in the woods/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I have come here to avenge my family.  One season past, they were attacked by a trio of deadly tigers.  I came here to hunt the beasts down, but then I found the local rangers and residents here protect the tigers.  They seem to be legends in these parts.  The tigers even have name's!  They call them Eenot, Reggit and Kobb.  I wish I had help from a [fellow monk].");
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
		else {
			quest::say("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.");
		}
        }
        elsif ($text=~/fellow monk/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Good! The rangers are watching me so you must go alone.  I can only wait until the morning, then I must go.  If you find all three tigers, return their pelts to me and I shall reward you with something discovered for monks only.");
			#:: Spawn one and only one Kithicor Forest >> Eenot (20276) on grid 137
			quest::unique_spawn(20276, 137, 0, 1499.47, -22.75, 168.35);
			#:: Spawn one and only one Kithicor Forest >> Reggit (20277) on grid 138
			quest::unique_spawn(20277, 138, 0, 3063, 1636, 363);
			#:: Spawn one and only one Kithicor Forest >> Kobb (20278) on grid 139
			quest::unique_spawn(20278, 139, 0, 3741.9, 256.5, 496.2);
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
		else {
			quest::say("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.");
		}
        }
        elsif ($text=~/treant fists/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("The treant fists were created by great craftsmen.  They are for the fists of a monk and offer greater dexterity and increase the durability of one's soul.  My last pair were given to Master Puab of the Ashen House training grounds.");
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
		else {
			quest::say("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.");
		}
	}
}

sub EVENT_TIMER {
	#:: Match timer 'depop'
	if ($timer eq "depop") {
		#:: Stop the timer 'depop'
		quest::stoptimer("depop");
		#:: Depop with spawn timer active
		quest::depop_withtimer();
	}
}

sub EVENT_ITEM {
	#:: Match a 12341 - Unusual Tiger Pelt, a 12342 - Peculiar Tiger Pelt, and a 12343 - Strange Tiger Pelt
	if (plugin::takeItems(12341 => 1, 12342 => 1, 12343 => 1)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Good work.  I hope you had no run ins with the local rangers.  Here is my reward.  An object from the past which I found in my journeys.  Wish that I could reward also with [treant fists].");
			#:: Give a 12367 - Collar of Neshika
			quest::summonitem(12367);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(361, 10);		#:: + Ashen Order
			quest::faction(281, 1);			#:: + Knights of Truth
			quest::faction(309, 1);			#:: + Silent Fist Clan
			#:: Grant a small amount of experience
			quest::exp(100);
			#:: Create a timer 'depop' that loops every 10 seconds
			quest::settimer("depop", 10);
		}
		#:: Match if faction is Indifferent
		elsif ($faction == 5) {
			quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
			#:: Return a 12341 - Unusual Tiger Pelt
			quest::summonitem(12341);
			#:: Return a 12342 - Peculiar Tiger Pelt
			quest::summonitem(12342);
			#:: Return a 12343 - Strange Tiger Pelt
			quest::summonitem(12343);
		}
		else {
			quest::say("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.");
			#:: Return a 12341 - Unusual Tiger Pelt
			quest::summonitem(12341);
			#:: Return a 12342 - Peculiar Tiger Pelt
			quest::summonitem(12342);
			#:: Return a 12343 - Strange Tiger Pelt
			quest::summonitem(12343);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
