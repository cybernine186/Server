sub EVENT_SPAWN {
	#:: Create a timer 'sirran_depop' that triggers every 900 seconds (15 min)
	quest::settimer("sirran_depop", 900);
}

sub EVENT_TIMER {
	#:: Match timer 'sirran_depop'
	if ($timer eq "sirran_depop") {
		#:: Stop the timer 'sirran_depop' from triggering
		quest::stoptimer("sirran_depop");
		#:: Depop without spawn timer active
		quest::depop();
	}
}

sub EVENT_SAY {
	#:: Key a data bucket
	$key = sirran_status;
	if (quest::get_data($key) eq "1") {		#:: Island 1
		if ($text=~/hail/i) {
			quest::say("Ehem! What? Oh, hello there! Sirran be my name. Yes? So, come to the Plane of Sky, have you? Killed all my fairies! Hah! So! Do you wish to know how to traverse this plane? Or should I just go away? I know much about this plane. You would do well to listen!");
		}
		elsif ($text=~/traverse this plane/i) {
			quest::say("Ahah! Wise you are and tell you I will. Hrm? Don't have wings, do you? Fairies have swords! Fairies stole my lucky feet! Hand me them, one by one, and be in for a treat! Haha!");
		}
	}
	elsif (quest::get_data($key) eq "2") {		#:: Island 2
		if ($text=~/hail/i) {
			quest::say("Ah! Come far you have! You are all crazy! I like it! Swords spin no more! Spin, spin. Unlucky they were! I thought them [vain]!");
		}
	}
	elsif (quest::get_data($key) eq "3") {		#:: Island 3
		if ($text=~/hail/i) {
			quest::say("What! Die already! Come so far. Can't you see I am cold! Give me a cloak or something! Bah! You don't look the type to give anything! Be off with you, then!");
			quest::say("Always want something for nothing? Oh yes, you gave me something! Here you go! Take this! Used one you have. [Teleport] away you will! Let me know, or no kill! Haha!");
		}
	}
	elsif (quest::get_data($key) eq "4") {		#:: Island 4
		if ($text=~/hail/i) {
			quest::say("You again! Aren't you dead yet? Well, give me the token items you got, and move on you will. Maybe. Oh! Wait!! Rings go on fingers, yes they do! Gimme a ring and I'll help you!");
		}
	}
	elsif (quest::get_data($key) eq "5") {		#:: Island 5
		if ($text=~/hail/i) {
			quest::say("Children, run to the wall and give the deputies some milk. Oh, I almost forgot. Give me your trinkets, or give me death!");
		}
	}
	elsif (quest::get_data($key) eq "6") {		#:: Island 6
		if ($text=~/citanul eht narris, liah/i) {
			quest::say("Lortap llaw taerg eht fo lahsram, Narris lahsram ma I. Flesym ecudortni ot em wolla. Sgniteerg");
		}
		elsif ($text=~/llaw eht htiw eno I ma/i) {
			quest::say("Kcul doog! Ouy rof ydaer si erips eht fo retsis eht won, sdik boj doog.");
			#:: Spawn The Plane of Sky >> #Sister_of_the_Spire (71076) 
			quest::spawn(71076, 0, 0, -927.4, -1033.2, 1092.5, 66.1);
		}
	}
	elsif (quest::get_data($key) eq "7") {		#:: Island 7
		if ($text=~/hail/i) {
			quest::say("Nyah! The tears are welling up in my eyes! I am so proud. I think of you as if I were your father! Sniff. Sniff. Give me Veeshan, and I give you death");
		}
	}
}

sub EVENT_ITEM {
	#:: Key a data bucket
	$key = sirran_status;
	if (quest::get_data($key) eq "1") {		#:: Island 1
		#:: Match a 20920 - Miniature Sword
		if (plugin::takeItems(20920 => 1)) {
			quest::say("These are the keys! Use them well! Hold them in your hand and touch them to the runed platforms! Guide you thy will! Hah! The last to go, must tell me so, or be in for a [hassle]! If there's a hassle, I will go!");
			#:: Give a 20911 - Key of Swords
			quest::summonitem(20911);
		}
		#:: Match a 20921 - Lost Rabbit's Foot
		elsif (plugin::takeItems(20921 => 1)) {
			quest::say("These are the keys! Use them well! Hold them in your hand and touch them to the runed platforms! Guide you thy will! Hah! The last to go, must tell me so, or be in for a [hassle]! If there's a hassle, I will go!");
			#:: Give a 20912 - Key of the Misplaced
			quest::summonitem(20912); # Key of the Misplaced
		}
		#:: Return unused items
		plugin::returnUnusedItems();
	}
	elsif (quest::get_data($key) eq "2") {		#:: Island 2
		#:: Match a 20922 - Broken Mirror
		if (plugin::takeItems(20922 => 1)) {
			quest::say("You move fast, you crazy kids! Keep going! Prod you I will! Stuck here I have been! Oh! Let me know when you are [done] or this will be no fun! Haha");
			#:: Give a 20913 - Key of Misfortune
			quest::summonitem(20913);
		}
		#:: Return unused items
		plugin::returnUnusedItems();
	}
	elsif (quest::get_data($key) eq "3") {		#:: Island 3
		#:: Match a 20923 - Animal Figurine
		if (plugin::takeItems(20923 => 1)) {
			quest::say("Always want something for nothing? Oh yes, you gave me something! Here you go! Take this! Used one you have. [Teleport] away you will! Let me know, or no kill! Haha!");
			#:: Give a 20914 - Key of Beasts
			quest::summonitem(20914);
		}
		#:: Return unused items
		plugin::returnUnusedItems();
	}
	elsif (quest::get_data($key) eq "4") {		#:: Island 4
		#:: Match a 20924 - Bird Whistle
		if (plugin::takeItems(20924 => 1)) {
			quest::say("What is this? Bah! Take that! And this! What was I thinking? I was thinking you had best let me know when you use those teleporters. Just say, [Icky Bicky Barket]. Aye, that is what I was thinking.");
			#:: Give a 20915 - Avian Key
			quest::summonitem(20915);
		}
		#:: Return unused items
		plugin::returnUnusedItems();
	}
	elsif (quest::get_data($key) eq "5") {		#:: Island 5
		#:: Match a 20925 - Noise Maker
		if (plugin::takeItems(20925 => 1)) {
			quest::say("Phew! These are heavy. Well, not really. I'm sure I don't have to remind you to remind me when you are [leaving].");
			#:: Give a 20916 - Key of the Swarm
			quest::summonitem(20916);
		}
		#:: Return unused items
		plugin::returnUnusedItems();
	}
	elsif (quest::get_data($key) eq "6") {		#:: Island 6
		#:: Match a 20926 - Dull Dragon Scale
		if (plugin::takeItems(20926 => 1)) {
			quest::say("Dnib a ni era uoy ro esarhp eht yas dna yrruh!! Sruoy era syek eht dna romra em evig. Erom on gnits seixib eht ahahahahah!");
			#:: Give a 20917 - Key of Scale
			quest::summonitem(20917);
		}
		#:: Return unused items
		plugin::returnUnusedItems();
	}
	elsif (quest::get_data($key) eq "7") {		#:: Island 7
		#:: Match a 20927 - Replica of the Wyrm Queen
		if (plugin::takeItems(20927 => 1)) {
			quest::say("Not too much farther. I spit on thee knave! Ehem. Take these. Go on! Make your fortunes. No one cares about Narris. I mean Sirran. Hah! See if I care what you think! Oh, when did you say you were [leaving]?");
			#:: Give a 20918 - Veeshan's Key
			quest::summonitem(20918);
		}
		#:: Return unused items
		plugin::returnUnusedItems();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_AGGRO {
	quest::shout("What?! Now you've done it! The bunnies are angry! ANGRY I TELL YOU!");
}
