sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Your eyes betray your eagerness and your naivety young one. I am Unmuz Tukore. Scourge Knight of the Bloodsabers. If you have come seeking the [training as a Shadowknight] then I will offer you guidance.");
	}
	elsif ($text=~/training as a shadowknight/i) {
		#:: Removed "Suit of Armor" quest text indicator
		quest::say("We Scourge Knights of the Bloodsabers, often refered to as shadowknights by those less knowledgeable of our sect, are gifted by Bertoxxulous with prowess in combat and powers over the spirits and bodies of the dead. It is through discipline, training, and devotion to the Plague Lord that we are granted our powers. You must first equip yourself with a suit of armor to defend you in battle from the weapons of our [enemies].");
	}
#::	elsif ($text=~/suit of armor/i) {
#:: 		quest::say("Take this note to Wellis Pestule. He will assist you in obtaining your armor. Once you have been properly outfitted return to me. I will allow you to assist me with a [pressing matter].");
#:: 		quest::summonitem(20206);
#:: 	}
#::	elsif ($text=~/pressing matter/i) {
#::		quest::say("The Knights of Thunder, the order of paladins loyal to Karana, the Storm Lord, have been paying close attention for signs of us Bloodsabers in the streets of Qeynos. By orders of Antonius Bayle known disciples of the Plague Lord are to be executed by the Knights of Thunder. A particular knight, Grennet Stormhands, has recently discovered the loyalties of a Bloodsaber member that held a valuable position among the merchants of Qeynos. Grennet is to be hunted and slain for our loss. Find this Knight of Thunder and bring me his head.");
#::	}
	elsif($text=~/enemies/i) {
		quest::say("The Knights of Thunder and the Priests of Life are our primary foes. and the power behind the throne of Antonius Bayle IV. If it were not for their presence this city would have been claimed in the name of the Plague Lord long ago. Instead we are forced to hide our temple in the catacombs and move through the sewers to avoid the patrols of Qeynos Guards in the streets. Be mindful of your words when not within the walls of this temple. The Qeynos Guards would execute you for your allegiance to the Bloodsabers.");
	}
}

sub EVENT_ITEM {
#::	#:: Match a 20186 - Grennet Stormhand's Head
#::	if (plugin::takeItems(20186 => 1)) {
#::		quest::say("Excellent, the Knights of Thunder must learn that by beginning an inquisition of the Bloodsabers they are effectively declaring war. Take this Rusty Scourge Knight Saber to a forge and sharpen it with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done take the Tarnished Scourge Knight Saber and a Giant King Snake Skin to Wellis Pestule and he will put the finsihing touches on the weapon.");
#::		#:: Give a 20187 - Rusty Scourge Knight Saber
#::		quest::summonitem(20187);
#::		#:: Ding!
#::		quest::ding();
#::		#:: Set factions
#::		quest::faction(221, 1);			#:: + Bloodsabers
#::		quest::faction(262, -1);		#:: - Guards of Qeynos
#::		quest::faction(296, 1);			#:: + Opal Darkbriar
#::		quest::faction(341, -1);		#:: - Priests of Life
#::		quest::faction(230, 1);			#:: + Corrupt Qeynos Guards
#::		#:: Grant a small amount of experience
#::		quest::exp(100);
#::	}
#::	#::plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	#:: Return unused items
	plugin::returnUnusedItems();
}
