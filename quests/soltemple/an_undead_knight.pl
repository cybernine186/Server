sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Away from this place of torment!  Make haste and flee before you, too, share my [gruesome fate]!!");
	}
	elsif ($text=~/gruesome fate/i) {
		quest::say("I was once a proud shadowknight, but failed I did in my master's quest.  I was sent into a lizard fortress deep in the swamplands.  I was to seek out an ancient item for my master.  I failed and was captured. The lizards stripped me of my [darkforge armor] and planned to boil me alive.  Before they could do so, I escaped.  Upon my return to my master's lair I found myself in a [worse predicament].");
	}
	elsif ($text=~/worse predicament/i) {
		quest::say("I was torn apart by my master and my bones were given as toys to my master's associates!!  I am now only half Grandyf the Vile.  My hands, feet and legs were sent here and assembled with spare bones of other unfortunates.  Since this is the case, I can only [create darkforge armor] in the form of boots, greaves and gauntlets.");
	}
	elsif ($text=~/create darkforge armor/i) {
		quest::say("I and I alone have the power to create darkforge armor!!  It was crafted for me so naturally it is to be worn by shadowknights only.  My armor was taken by the lizardman crusaders.  Unfortunately for them, it lost all power and cannot be worn.  I would be glad to see it put to good use. Do you [seek the darkforge armor]?");
	}
	elsif ($text=~/seek the darkforge armor/i) {
		quest::say("Darkforge gauntlets require both of my decayed gauntlets and one enchanted platinum bar.  For the darkforge greaves, I will need both decayed legplates and two pieces of melatite from the Solusek Mining Company.  For the boots, I need both my decayed boots and two parts of fairy dust.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12292 - Decayed Left Gauntlet, a 12291 - Decayed Right Gauntlet, and a 16507 - Enchanted Platinum Bar
	if (plugin::takeItems(12292 => 1, 12291 => 1, 16507 => 1)) {
		quest::say("Well done, $name, here is your reward.");	#:: Not confirmed
		#:: Give a 3144 - Darkforge Gauntlets
		quest::summonitem(3144);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 12294 - Decayed Left Legplate, a 12293 - Decayed Right Legplate, and two 12297 - Melatite
	elsif (plugin::takeItems(12294 => 1, 12293 => 1, 12297 => 2)) {
		quest::say("You have been granted the darkforge greaves!!");
		#:: Give a 3145 - Darkforge Greaves
		quest::summonitem(3145);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 12296 - Decayed Left Boot, a 12295 - Decayed Right Boot, and two 12106 - Fairy Dust
	elsif (plugin::takeItems(12296 => 1, 12295 => 1, 12106 => 2)) {
		quest::say("Well done, $name, here is your reward.");	#:: Not confirmed
		#:: Give a 3146 - Darkforge Boots
		quest::summonitem(3146);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
