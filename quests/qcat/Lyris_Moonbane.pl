sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, without proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_ENTER {
	#:: Match a 18721 - Blood Stained Note
	if (plugin::check_hasitem($client, 18721)) { 
		$client->Message(15,"As you orient yourself amongst the filth and decay of the catacombs, a menacing figure turns to address you. 'I am Lyris Moonbane. Should you wish to dedicate your pathetic life to the way of Bertoxxulous and learn the ways of the Necromancer, read the note in your inventory and hand it to me to begin your training.'");
	}
}

sub EVENT_ITEM {
	#:: Match a 18721 - Blood Stained Note
	if (plugin::takeItems(18721 => 1)) {
		quest::say("So, you wish to to walk with the dead, eh? The army of the Plaguebringer is quietly amassing its diseased soldiers in the shadows and sewers of Norrath. Go to Brother Bruax. He will turn you into something useful, I hope.");
		#:: Give a 13552 - Dark Stained Purple Robe*
		quest::summonitem(13552);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(221, 100);		#:: + Bloodsabers
		quest::faction(262, -15);		#:: - Guards of Qeynos
		quest::faction(296, 10);		#:: + Opal Darkbriar
		quest::faction(341, -25);		#:: - Priest of Life
		quest::faction(230, 5);			#:: + Corrupt Qeynos Guards
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
