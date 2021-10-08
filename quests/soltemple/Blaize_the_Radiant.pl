
sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("Hail, faithful one. I am Blaize the Radiant. Brother Gavel and I are well known among clerics for our forging skills, but special payment is required for our services. Special [Ingots and Icons] given to our members have been lost, and we will reward whoever retrieves them for us.");
	}
	elsif ($text=~/ingots and icons/i) {
		quest::say("The Ingots and Icons are all named after the virtues of the cleric who held them. The virtues I require are those of the [Reliant], the [Ardent], the [Fervent] and the [Penitent].");
	}
	elsif ($text=~/reliant/i) {
		quest::say("Turgan the Reliant lived in a cabin in the Kithicor woods until there was a great fire. Searching the burned cabins there may turn something up. He always loved Lake Rathetear as well. Bring me the Ingot of the Reliant, the Icon of the Reliant, and one Enchanted Platinum Bar and I will forge them into a reward for you.");
	}
	elsif ($text=~/ardent/i) {
		quest::say("Theo the Ardent was in constant war with a gnome necromancer in Befallen named Babbinsbort, but he never could defeat him. Poor Theo drown on an expedition to Everfrost when the ice of the frozen river gave way underneath him. Bring me the Ingot of the Ardent, the Icon of the Ardent, and 1 Galvanized Platinum Bar and I will forge them into a reward for you.");
	}
	elsif ($text=~/fervent/i) {
		quest::say("Jovan the Fervent was always prone to vice. He lost his ingot in a game of Kings Court with an aviak named Gull in the Ocean of Tears. After that he became a drunkard and it has been said he lurks around the bars in Highpass Hold. Bring me the Ingot of the Fervent, the Icon of the Fervent, and 1 Vulcanized Platinum Bar and I will forge them into a reward for you.");
	}
	elsif ($text=~/penitent/i) {
		quest::say("Astrid the Penitent often visited the frogloks of Upper Guk. She once told me her ingot was hidden underwater there. I found that strange because she couldn't swim. She was also a good friend to the Kerrans of Kerra Ridge, where she lost her life fighting against the Erudite hereitic Maugarim. Bring me the Ingot of the Penitent, the Icon of the Penitent, and one Magnetized Platinum Bar and I will forge them into a reward for you.");
	}
}

sub EVENT_ITEM {
	#:: Match a 19001 - Ingot of the Reliant, a 19002 - Icon of the Reliant, and a 16507 - Enchanted Platinum Bar
	if (plugin::takeItems(19001 => 1, 19002 => 1, 16507 => 1)) {
		quest::say("Wear this with pride!");
		#:: Give a 4921 - Boots of the Reliant
		quest::summonitem(4921);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 19007 - Ingot of the Penitent, a 19008 - Icon of the Penitent, and a 19049 - Magnetized Platinum Bar
	elsif (plugin::takeItems(19007 => 1, 19008 => 1, 19049 => 1)) {
		quest::say("Wear this with pride!");
		#:: Give a 4924 - Greaves of the Penitent
		quest::summonitem(4924);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 19003 - Ingot of the Ardent, a 19004 - Icon of the Ardent, and a 19047 - Galvanized Platinum Bar
	elsif (plugin::takeItems(19003 => 1, 19004 => 1, 19047 => 1)) {
		quest::say("Wear this with pride!");
		#:: Give a 4922 - Gauntlets of the Ardent
		quest::summonitem(4922);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 19005 - Ingot of the Fervent, a 19006 - Icon of the Fervent, and a 19048 - Vulcanized Platinum Bar
	elsif (plugin::takeItems(19005 => 1, 19006 => 1, 19048 => 1)) {
		quest::say("Wear this with pride!");
		#:: Give a 4923 - Vambraces of the Fervent
		quest::summonitem(4923);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
