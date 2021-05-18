sub EVENT_SAY {
	#:: Match if faction is Indifferent or better
	if ($faction <= 5) {
		if ($text=~/hail/i) {
			quest::say("What business do you have here?!! Trying to keep safe? Expecting us to fight your battles? Bah!!");
			#:: Send a signal "1" to Dagnor's Cauldron >> Nyrien_Lyrdarniel (70006) with a five second delay
			quest::signalwith(70006, 1, 5);
		}
		elsif ($text=~/chalice of conquest/i) { 
			quest::say("Looking for the chalice, are you? Ha!! I don't know where it is, but I know a [lost soul] who does and he could lead you right to it. He had a taste of it and now he can't get enough. He is sort of under the weather, or do I mean under the ground? Ha!!");
		}
		elsif ($text=~/lost soul/i) { 
			quest::say("The orc named Captain Klunga knows where it's buried. Unfortunately, his time on Norrath has passed. I happen to know two things... one, he is buried somewhere in this territory and two, I can [raise Klunga] and he can show you where the chalice is.");
		}
		elsif ($text=~/raise klunga/i) {
			quest::say("I can raise Captain Klunga if I have a portion of his blood, an item he once owned and the most important part, 100 gold coins!! Hehe!! A gnome's got to make a living, you know?");
		}
	} 
	else {
		quest::say("You dare to speak to a member of the Eldritch Collective!! You had best leave before you find your soul displaced from your body.");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from /cauldron/Nyrien_Lyrdarniel.pl
	if ($signal == 1) {
		quest::say("Ha!! One like that one stands no chance within this realm. The goblins shall skin him alive!!");
		#:: Send a signal "1" to Dagnor's Cauldron >> Elmion_Hendrys (70005) with a five second delay
		quest::signalwith(70005, 1, 5);
	}
	#:: Match a signal "2" from /cauldron/Sigan_Ilbirkun.pl
	elsif ($signal == 2) {
		quest::say("You're welcome to leave this camp at once!! We are not here to keep you warm and safe from harm!!");
		#:: Send a signal "1" to Dagnor's Cauldron >> Nyrien_Lyrdarniel (70006) with a five second delay
		quest::signalwith(70006, 1, 5);
	}
}

sub EVENT_ITEM {
	#:: Match 18946 - Bloodstained Note, 12280 - Klunga's Bracelet, and 100 gold
	if (plugin::takeItemsCoin(0, 0, 100, 0, 12280 => 1, 18946 => 1)) {
		quest::say("Biggily boo, biggily borc.. Raise that stinky orc!! Bamm!! Okay!! It's done. Now all you have to do is find him in the spot where his soul left him and give him an orc shovel. Oh!! I didn't mention that? Oh, well. I'm sure you can find one.. somewhere. Now, get lost before I turn you into a toad!");
		#:: Give a 12277 - Candle of Bravery
		quest::summonitem(12277);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(245, 25);		#:: + Eldritch Collective
		quest::faction(238, -25);		#:: - Dark Reflection
		quest::faction(239, -25); 		#:: - The Dead
		quest::faction(255, 25);		#:: + Gem Choppers
		quest::faction(333, 25); 		#:: + King Ak'Anon
		#:: Grant a large amount of experience
		quest::exp(18000);
		#:: Spawn Dagnor's Cauldron >> #Captain_Klunga (70072)
		quest::spawn2(70072, 0, 0, -2133.49, -727.05, 154.86, 0);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("All shall die before the might of the Fabulous Four!!");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("The entire Eldritch Collective shall feel the vibrations of my passing. They will know of your foul deed.");
}
