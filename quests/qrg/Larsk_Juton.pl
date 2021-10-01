sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, Adventurer! I hope you are enjoying your time in Surefall Glade. You must be careful when leaving the Jaggedpine. There have been many report of [Sabertooths] attacking travelers.");
	}
	elsif ($text=~/sabertooths/i) {
		quest::say("The gnolls of Blackburrow are called Sabertooths. They have been seen in force on a regular basis. They are surely up to something. We have even heard rumors of a [pact] between Qeynos merchants and the dogs.");
	}
	elsif ($text=~/pact/i) {
		quest::say("Sources have come forward to tell of a pact between a merchant of Qeynos and the Sabertooths. It all has to do with blades and brew. We hear that a meeting will occur soon, somewhere in the Qeynos Hills at night. Do not fear, we shall find a brave ranger to [halt this meeting].");
	}
	elsif ($text=~/halt this meeting/i) {
		quest::say("Very good of you. Stop this meeting by killing the gnoll in Qeynos Hills. We hear that he shall be there in the late evening, and that his name is Furgoot or Furgy, something like that. Find him and kill him. I want his head. And if you should find any evidence of who the merchant is, be sure to hand it over to me.");
	}
	elsif ($text=~/assist in the extermination of the gnoll brewers/i) {
		quest::say("Within the bowels of Blackburrow, our scouts have reported seeing the gnoll brewers.  You will go and brave the lair of the dogs and slay these brewers in order to cease the flow of Blackburrow Stout.  During your mission, should you find any Blackburrow casks, you must return them to me.  When you have recovered three of these casks, I shall award you the [Cloak of Jaggedpine].");
	}
	elsif ($text=~/cloak of jaggedpine/i) {
		quest::say("The Cloak of Jaggedpine was made for those loyal to the ways of the forest.  It is enchanted to increase one's dexterity.  It is awarded to those who have aided in our cause to rid the land of those vile dogs called the Sabertooths.  Should you earn one, be sure to hold onto it - you never know when we may alter the enchantments placed upon the cloak.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13309 - Gnoll Head
	if (plugin::takeItems(13309 => 1)) {
		quest::say("So, I see you rid the hills of the beast. Good work! I have a reward for you. I hope it will be usefull. I am afraid this gnoll's death will not halt the alliance between the two. I shall require your services to [assist in the extermination of the gnoll brewers].");
		#:: Give a 2140 - Raw-hide Tunic
		quest::summonitem(2140);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(302, 25);	#:: + Protectors of Pine
		quest::faction(272, 6);		#:: + Jaggedpine Treefolk
		quest::faction(306, -3);	#:: - Sabertooths of Blackburrow
		quest::faction(262, 1);		#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 200 to 400cp
		my %cash = plugin::RandomCash(200,400);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match three 17970 - Blackburrow Cask
	elsif (plugin::takeItems(17970 => 3)) {
		quest::say("Excellent!  Ridding the area of those foul beasts will certainly slow down whatever it is they are planning.  Here is the Cloak of Jaggedpine.  You should keep this, for you never know when we may decide to alter the enchantments on it.");
		#:: Give a 2915 - Cloak of Jaggedpine
		quest::summonitem(2915);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(302, 20);	#:: + Protectors of Pine
		quest::faction(272, 5);		#:: + Jaggedpine Treefolk
		quest::faction(306, -3);	#:: - Sabertooths of Blackburrow
		quest::faction(262, 5);		#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(1000);
	}
	#:: Match one 18811 - Tattered Note
	elsif (plugin::takeItems(18811 => 1)) {
		quest::say("Fine Work, $name. Hmmm. It seems this needs taking care of. Take this note to the Captain of the City Guard in Qeynos. His name is Captain Tillin. He will have to attend to this matter. Also.. Let me see the gnoll's head. I must know you killed him. Be safe, my friend. I am sure that whoever this McNeal is, he was simply a lackey. Whoever he works for is most likely going to be looking for you. Watch your back in Qeynos.");
		#:: Give a 18815 - Tattered Note
		quest::summonitem(18815);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(302, 5);		#:: + Protectors of Pine
		quest::faction(272, 1);		#:: + Jaggedpine Treefolk
		quest::faction(306, -1);	#:: - Sabertooths of Blackburrow
		quest::faction(262, 1);		#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(200);
		#:: Create a hash for storing cash - 100 to 200cp
		my %cash = plugin::RandomCash(100,200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
