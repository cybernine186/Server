sub EVENT_WAYPOINT_ARRIVE {
	#:: Match if waypoint is 16, 43 or 70
	if (($wp == 16) || ($wp == 43) || ($wp == 70)) {
		quest::say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Oh, hey there.. How ya doing? My name's Den. I work for ol' [Rohand] here, unloading the [shipments] that come in from overseas.");
	}
	elsif ($text=~/rohand/i) {
		quest::say("Ol' Captain Rohand is the owner of the Mermaid's Lure. He trades goods with sailors and sea [merchants]. I think that old man was even born at sea.. And he's got more stories than fish have scales.");	
	}
	elsif (($text=~/shipments/i) || ($text=~/merchants/i)) {
		quest::say("Yeah.. We get merchants and traders with goods from here to [Odus].");
	}
	elsif ($text=~/blank scroll sheets/i) {
		quest::say("Blank scroll sheets, huh? You know, there seems to be a shortage of these around here lately. But, hey friend, ol' Denny-boy here would never steer you wrong. I'll sell you some for 2 gold. I know, I'm too kind.");
	}
	elsif ($text=~/odus/i) {
		quest::say("Odus? I've never been there, but I hear it's a long journey.");
	}
}

sub EVENT_ITEM {
	#:: Match two gold
	if (plugin::takeCoin(0, 0, 2, 0)) {
		quest::say("Yeah, well, these are pretty hard to come by. In fact, these came all the way from Odus. Enjoy, and tell your buddies.");
		#:: Ding!
		quest::ding();
		#:: Give a 18006 - Blank Scroll Sheets
		quest::summonitem(18006);
		#:: Set factions
		quest::faction(223, 1);		#:: + Circle Of Unseen Hands
		quest::faction(291, -1);	#:: - Merchants of Qeynos
		quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
		quest::faction(262, -1);	#:: - Guards of Qeynos
		quest::faction(273, 1);		#:: + Kane Bayle
		#:: Grant a small amount of experience
		quest::exp(200);
	}
	#:: Match 13784 - Package for Den
	elsif (plugin::takeItems(13784 => 1)) {
		quest::say("All right, I'll make sure this gets put on the next boat to Erudin. But now, I need a favor of you. Since I'm stuck here working the docks all day, I need someone to run out to Qeynos Hills and bring me back various pelts and skins. I got a customer in Odus who is trying to get a new shop started, and he needs some samples. Bring me back some snake scales, a high quality bear skin, a high quality wolf skin, and some bat fur. Make sure the quality is good, I can't send him rags.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(223, 10);	#:: + Circle Of Unseen Hands
		quest::faction(291, -1);	#:: - Merchants of Qeynos
		quest::faction(230, 1);		#:: + Corrupt Qeynos Guards
		quest::faction(262, -1);	#:: - Guards of Qeynos
		quest::faction(273, 1);		#:: + Kane Bayle
		#:: Grant a small amount of experience
		quest::exp(200);
	}
	#:: Match 13069 - Bat Fur, 13755 - High Quality Wolf Skin, 13752 - High Quality Bear Skin, 13070 - Snake Scales
	elsif (plugin::takeItems(13069 => 1, 13755 => 1, 13752 => 1, 13070 => 1)) {
		quest::say("Great... Hopefully he will like these samples, and order a lot more from me. Here's some gold for your efforts. Also, could you pass this note on to Ghil next time you talk to him? Thanks again.");
		#:: Ding!
		quest::ding();
		#:: Give a 18796 - Note for Ghil
		quest::summonitem(18796);
		#:: Set factions
		quest::faction(223, 20);	#:: + Circle Of Unseen Hands
		quest::faction(291, -3);	#:: - Merchants of Qeynos
		quest::faction(230, 3);		#:: + Corrupt Qeynos Guards
		quest::faction(262, -3);	#:: - Guards of Qeynos
		quest::faction(273, 2);		#:: + Kane Bayle
		#:: Grant a moderate amount of experience
		quest::exp(2000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
