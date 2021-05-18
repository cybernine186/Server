#:: Create a scalar variable to store an item count
my $ItemCount;

sub EVENT_SPAWN {
	#:: Reset item count on spawn
	$ItemCount = 0;
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Heh? What's yer name? $name? Never heard of ya. Now quit breathin' on me and buy us some [drinks]!");
	}
	elsif ($text=~/drinks/i) {
		quest::say("<BURP!> Yeah. Gimme a.. <BURP!> er.. honey mead.");
	}
	elsif ($text=~/kaladim/i) {
		quest::say("Heh? Kaladim, you say? It's a long way from here, I tell you.. Home to us dwarves it is. I miss it sometimes though.. Its tough being a swashbuckling dwarf with my rugged good looks when all the other dwarves are so envious. Cripes, $name... You got me all misty-eyed now.. <BURP> Peh! Buy me a honey mead, will ya?");
	}
	elsif ($text=~/dragon/i) {
		quest::say("What? Dragon? That was a joke, ya zombie! Sheesh! I miss [Kaladim]..");
	}
	elsif ($text=~/skippy/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Skippy? You mean that fish farmer? Heh heh heh. What a moron. And his brother [Beren] has the nerve to actually threaten ME!?.. Burp.. Bah. Remind me to tell [Kane] about that steaming pile of gnoll dung.");
		}
		else {
			quest::say("You had better just be.. <BURP!>.. minding your own business if you know what is good for you. Gnollbreath. We Irontoes are proud and strong bunch of dwarves from [Kaladim]. We crush weaklings like you. <BURP>");
		}
	}
	elsif ($text=~/beren/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Don't even mention that weakling's name. He.. burp.. Keeps threatening me. ME! Trumpy IRONTOE!!! Peh! That useless son of a goblin had better wise up and realize that in this burg if you ain't with [Kane], you are against him. And if you are against him.. burp.. you ain't nothing but a corpse.");		
		}
		else {
			quest::say("You had better just be.. <BURP!>.. minding your own business if you know what is good for you. Gnollbreath. We Irontoes are proud and strong bunch of dwarves from [Kaladim]. We crush weaklings like you. <BURP>");
		}
	}
	elsif ($text=~/kane/i) {
			#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Ah.. burp.. that piece of cr.. eh? Oh its you.. Kane runs this burg.. or at least he will.. if [Sragg] can get his act together.");		
		}
		else {
			quest::say("You had better just be.. <BURP!>.. minding your own business if you know what is good for you. Gnollbreath. We Irontoes are proud and strong bunch of dwarves from [Kaladim]. We crush weaklings like you. <BURP>");
		}
	}
	elsif ($text=~/sragg/i) {
			#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Where did you hear that name?!? Not from me! I didn't say nothing about Sragg or those Bloodsabers or their dang temple in the sewers! Get away from me ya hobgoblins! I don't wants no trouble!");
		}
		else {
			quest::say("You had better just be.. <BURP!>.. minding your own business if you know what is good for you. Gnollbreath. We Irontoes are proud and strong bunch of dwarves from [Kaladim]. We crush weaklings like you. <BURP>");
		}
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 2--near Sunsa at the bar
	if ($wp == 2) {
		quest::say("Time to drain the [dragon].. if ya know what I mean.. Bwah ha ha ha.");
		#:: Send a signal "1" to South Qeynos >> Sunsa_Jocub (1074) with no delay
		quest::signalwith(1074,1,0);
	}
	#:: Match waypoint 4--near Bruno at the door
	elsif ($wp == 4) {
		quest::say("Outta my way, ya big lummox!");
		#:: Send a signal "1" to South Qeynos >> Bruno_Barstomper (1075) with no delay
		quest::signalwith(1075,1,0);
	}
	#:: Match waypoint 7--near the guards at the gate
	elsif ($wp == 7) {
		quest::say("<BURP!> Heh heh.. Enjoy that one, boys!");
		#:: Send a signal "3" to South Qeynos >> Guard_Beren (1090) with no delay
		quest::signalwith(1090,3,0);
	}
	#:: Match waypoint 11--at the end of the dock near Faren
	elsif ($wp == 11) {
		#:: Do animation 1 -- Kick
		quest::doanim(1);
	}
	#:: Match waypoint 12--at the end of the dock near Faren
	elsif ($wp == 12) {
		quest::say("Hey, Fishboy! You dropped something! Bwah ha ha ha!");
		#:: Send a signal "2" to South Qeynos >> Faren (1159) with no delay
		quest::signalwith(1159,2,0);
	}
	#:: Match waypoint 17--near the guards at the gate
	elsif ($wp == 17) {
		quest::say("Heh. What a loser!");
		#:: Send a signal "4" to South Qeynos >> Guard_Beren (1090) with no delay
		quest::signalwith(1090,4,0);
	}
}
		
sub EVENT_SIGNAL {
	#:: Match signal "1" from /qeynos/Faren.pl
	if ($signal == 1) {
		quest::say("Better start learning, [Skippy].");
		#:: Send a signal "3" to South Qeynos >> Faren (1159) with no delay
		quest::signalwith(1159,3,0);
	}
	#:: Match signal "2" from /qeynos/Guard_Beren.pl
	elsif ($signal == 2) {
		quest::say("Peh! What have you been eating? Your brother's bait? You are lucky I don't have time to give you the beating you so richly deserve.");
	}
	#:: Match signal "3" from /qeynos/Sunsa_Jocub.pl
	elsif ($signal == 3) {
		quest::say("You know you love me.");
	}
}
		
sub EVENT_ITEM {
	#:: Match four 13033 - Honey Mead
	if (plugin::takeItems(13033 => 4)) {
		quest::say("BWAH hah hah! I knew you wasn't the loser you.. <gulp>.. <gulp>.. appear to be! I will have to tell [Kane].. <burp>.. all about you. Maybe get you in the gang!");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(223, 1);		#:: + Circle of Unseen Hands
		quest::faction(291, -1);	#:: - Merchants of Qeynos
		quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
		quest::faction(262, -1);	#:: - Guards of Qeynos
		quest::faction(273, 1);		#:: + Kane Bayle
		#:: Grant a small amount of experience
		quest::exp(200);
		#:: Reset item count
		$ItemCount = 0;
	}
	#:: Match three 13033 - Honey Mead
	elsif (plugin::takeItems(13033 => 3)) {
		if ($ItemCount == 0) {
			quest::say("Beh! Thanks, Skippy. Why don't ya buy yourself one? And.. <gulp>.. <burp>.. get me another!");
			#:: Increment the item count variable
			$ItemCount++;
			$ItemCount++;
			$ItemCount++;
		}
		else {
			quest::say("BWAH hah hah! I knew you wasn't the loser you.. <gulp>.. <gulp>.. appear to be! I will have to tell [Kane].. <burp>.. all about you. Maybe get you in the gang!");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(223, 1);		#:: + Circle of Unseen Hands
			quest::faction(291, -1);	#:: - Merchants of Qeynos
			quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
			quest::faction(262, -1);	#:: - Guards of Qeynos
			quest::faction(273, 1);		#:: + Kane Bayle
			#:: Grant a small amount of experience
			quest::exp(200);
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Match two 13033 - Honey Mead
	elsif (plugin::takeItems(13033 => 2)) {
		if ($ItemCount <= 1) {
			quest::say("Beh! Thanks, Skippy. Why don't ya buy yourself one? And.. <gulp>.. <burp>.. get me another!");
			#:: Increment the item count variable
			$ItemCount++;
			$ItemCount++;
		}
		else {
			quest::say("BWAH hah hah! I knew you wasn't the loser you.. <gulp>.. <gulp>.. appear to be! I will have to tell [Kane].. <burp>.. all about you. Maybe get you in the gang!");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(223, 1);		#:: + Circle of Unseen Hands
			quest::faction(291, -1);	#:: - Merchants of Qeynos
			quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
			quest::faction(262, -1);	#:: - Guards of Qeynos
			quest::faction(273, 1);		#:: + Kane Bayle
			#:: Grant a small amount of experience
			quest::exp(200);
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Match one 13033 - Honey Mead
	elsif (plugin::takeItems(13033 => 1)) {
		if ($ItemCount <= 2) {
			quest::say("Beh! Thanks, Skippy. Why don't ya buy yourself one? And.. <gulp>.. <burp>.. get me another!");
			#:: Increment the item count variable
			$ItemCount++;
		}
		else {
			quest::say("BWAH hah hah! I knew you wasn't the loser you.. <gulp>.. <gulp>.. appear to be! I will have to tell [Kane].. <burp>.. all about you. Maybe get you in the gang!");
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(223, 1);		#:: + Circle of Unseen Hands
			quest::faction(291, -1);	#:: - Merchants of Qeynos
			quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
			quest::faction(262, -1);	#:: - Guards of Qeynos
			quest::faction(273, 1);		#:: + Kane Bayle
			#:: Grant a small amount of experience
			quest::exp(200);
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
