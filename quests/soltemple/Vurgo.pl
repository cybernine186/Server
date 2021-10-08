sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome! I am Vurgo, follower of Solusek Ro and holder of the [harvester] and the [Words of Darkness].");
	}
	elsif ($text=~/what harvester/i) {
		quest::say("I can forge you one, but you will need to bring me the correct [scythe components].");
	}
	elsif ($text=~/what scythe components/i) {
		quest::say("The first thing I need is a shadowed scythe from our mortal enemies, the shadowed men.");
	}
	elsif ($text=~/what words of darkness/i) {
		quest::say("I can scribe for you the Words of Darkness, but you will need to bring me the correct [word components].");
	}
	elsif ($text=~/what word components/i) {
		quest::say("The first thing that I need is a shadowed book from our mortal enemies, the shadowed men.");
	}
}

sub EVENT_ITEM {
	#:: Match a 5103 - Shadowed Scythe
	if (plugin::takeItems(5103 => 1)) {
		quest::say("'A shadowed scythe! Well done! The only good shadowed man is a banished one. As the weapons of the shadowed men have a tendency to disappear, I have given you a note to remind me that you have indeed supplied me with a scythe. Give me the note with the following items and I will forge you a harvester: a fungus eye from a mortuary fungus in the Estate of Unrest, a shadowed knife from an island goblin headmaster in the Ocean of Tears and a fire opal. Give me these items, and I will forge for you a harvester.");
		#:: Give a 18944 - Note
		quest::summonitem(18944);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 2);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 10538 - Fungus Eye, a 10031 - Fire Opal, a 7331 - Shadowed Knife, and a 18944 - Note
	elsif (plugin::takeItems(10538 => 1, 10031 => 1, 7331 => 1, 18944 => 1)) {
		quest::say("My note, a fungus eye, a shadowed knife and gold! All of the necessary components to make a harvester. Well done, adventurer!");
		#:: Give a 5316 - Harvester
		quest::summonitem(5316);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 2);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 10529 - Shadowed Book
	elsif (plugin::takeItems(10529 => 1)) {
		quest::say("A shadowed book! Well done! The more banished shadowed men the better. As the items of the shadowed men tend to disappear, I have given you a note to remind me that you have indeed supplied me with a book. Give me the note with the following items, and I will scribe for you Words of Darkness: a book of darkness from the Erudites in the tower by Lake Rathe, a book of frost from the icy goblin in Permafrost Keep and 300 golden coins. Bring me these items, and I will scribe for you the Words of Darkness.");
		#:: Give a 18945 - Note
		quest::summonitem(18945);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match 300 gold pieces, a 10536 - Book of Darkness, a 10537 - Book of Frost, and a 18945 - Note
	elsif (plugin::takeItemsCoin(0, 0, 300, 0, 10536 => 1, 10537 => 1, 18945 => 1)) {
		quest::say("All of the necessary components for me to scribe the Words of Darkness! Very good, adventurer. Take your tome, you have earned it.");
		#:: Give a 10527 - Words of Darkness
		quest::summonitem(10527);
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
