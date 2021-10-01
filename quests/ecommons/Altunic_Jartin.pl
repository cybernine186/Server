sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 2
	if ($wp == 2) {
		#:: Set running true (run)
		quest::SetRunning(1);
	}
	#:: Match waypoint 3
	elsif ($wp == 3) {
		#:: Set running false (walk)
		quest::SetRunning(0);
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, traveler! Have you need of provisions or perhaps other wares? I sell what I find upon the battlegrounds of the Commonlands.");
	}
	elsif ($text=~/house/i) {
		quest::say("Follow me.");
		quest::moveto(4791.06, -83.55, -51.47);
		#:: Spawn one and only one East Commonlands >> Squire_Narl (22196)
		quest::unique_spawn(22196, 0, 0, 4707.63, -105.49, -51.47);
	}
}

sub EVENT_ITEM { 
	#:: Match a 18896 - Note (Note To Altunic)
	if (plugin::takeItems(18896 => 1)) {
		quest::say("You are the one they have sent? A squire?!! I hope you can help me. I gather items strewn upon the grounds of the Commonlands. I sell them at good prices. Lately, I have been terrorized by a human rogue named Narl. He will no doubt appear at my [house] soon. Bring his head to me.");
	}
	#:: Match a 13867 - Human Head (Narl's Head)
	elsif (plugin::takeItems(13867 => 1)) {
		quest::say("You have performed a great service to me, but I fear others will attack me while I stroll the countryside. It would be very noble of you to fetch me a cloth shirt for protection from wicked creatures. It is not much, but it will help.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(330, -1);	#:: - Freeport Militia
		quest::faction(311, 1);		#:: + Steel Warriors
		quest::faction(281, 1);		#:: + Knights of Truth
		#:: Create a hash for storing cash - 1 to 10cp
		my %cash = plugin::RandomCash(1,10);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 1004 - Cloth Shirt
	elsif (plugin::takeItems(1004 => 1)) {
		quest::say("Thank you. You are very noble for a squire. I can see you becoming a very valuable asset to the Hall of Truth. Take this token. Tell Merko that you have [earned the Token of Generosity].");
		#:: Give a 13865 - Token of Generosity
		quest::summonitem("13865");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(330, -1);	#:: - Freeport Militia
		quest::faction(311,1);		#:: + Steel Warriors
		quest::faction(281,1);		#:: + Knights of Truth
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
