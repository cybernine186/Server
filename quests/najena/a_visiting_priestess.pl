sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name! Are you the champion Najena sent for?");
	}
	elsif ($text=~/champion of najena/i) {
		quest::say("Very well then $name. I am Aetherthane D'zitherak, Priestess of Innoruuk, seeker of the fabled and ancient Staff of Ankexfen. Have you ever heard of this relic before?");
	}
	elsif ($text=~/not heard of the staff/i) {
		quest::say("Long ago there existed a race known as the Ankexfen, after their progenitor Hazeg Ankexfen, who were created by Rallos Zek during the Elder Age. This race was quite intelligent and cunning. They quickly expanded their knowledge of magic and other planes, yet constantly yearned for more power. So along with their ogre counterparts, they set out to master the Plane of Earth. Alas, their attempts proved futile and the combined might of the other gods forced Rallos Zek back to the Planes of Power, leaving his creations to the whims of other gods.");
	}
	elsif ($text=~/ankexfen/i) {
		quest::say("The wrath of the unnamed gods was grim. Thousands of ogres were instantly slain - their empire left to crumble under the hand of retribution. The giants were flung across the face of Norrath like seeds to the wind. The Ankexfen's fate was more severe. The entire race was exterminated, but from the ashes were born the four goblin races. Exactly how this happened is unknown. But what is known is that each goblin was stripped of any knowledge and was neither informed of the other clans nor of their origins. Each clan was then transported to a separate environment to help preserve the gods will. However, the gods were not without mercy and each clan was granted a section of the staff. Upon each staff a crystal was adorned. These staves served to aid the goblin clans in understanding their environment. These remnants of the Staff of Ankexfen are what I desire. Bring them to me and the Priests of Innoruuk shall reward you.");
	}
}

sub EVENT_ITEM {
	#:: Match a 6323 - Ice Crystal Staff, a 6324 - Fire Crystal Staff, a 6335 - Slime Crystal Staff, and a 6336 - Water Crystal Staff
	if (plugin::takeItems(6323 => 1, 6324 => 1, 6335 => 1, 6336 => 1)) {
		#:: Match if faction is Indifferent or better
		if ($faction <= 5) {
			quest::emote("cackles with glee as she slowly assembles the runed rods, and with a muttered incantation and a flash of light, disappears, leaving only a note that slowly drifts to the ground.");
			#:: Give a 18401 - Scroll of Flayed Goblin Skin
			quest::summonitem(18401);
			#:: Ding!
			quest::ding();
			#:: Set factions
			quest::faction(340, 100);		#:: + Priests of Innoruuk
			quest::faction(278, 15);		#:: + King Naythox Thex
			quest::faction(362, -34);		#:: - Priests of Marr
			quest::faction(226, -25);		#:: - Clerics of Tunare
			quest::faction(341, -15);		#:: - Priests of Life
			quest::faction(1522, -400);		#:: - Primordial Malice
			#:: Grant a small amount of experience, based on level
			$client->AddLevelBasedExp(3, 30);
			#:: Depop with spawn timer active
			quest::depop_withtimer();
		}
		else {
			#:: Response not found
			#:: Return a 6323 - Ice Crystal Staff
			quest::summonitem(6323);
			#:: Return a 6324 - Fire Crystal Staff
			quest::summonitem(6324);
			#:: Return a 6335 - Slime Crystal Staff
			quest::summonitem(6335);
			#:: Return a 6336 - Water Crystal Staff
			quest::summonitem(6336);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
