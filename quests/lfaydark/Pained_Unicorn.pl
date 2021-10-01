# Druid Epic 1.0
# Lesser Faydark
# Pained Unicorn
# Written by Aramid August 29, 2006
#END of FILE Zone:lfaydark  ID:57035 -- Pained_Unicorn

if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_SAY {
		if($text=~/hail/i) {
			quest::pause(30);
			quest::say("Welcome $name");
		}
		if($text=~/corruption/i) {
			quest::emote("tosses its head back, drool falling from its mouth");
			quest::say("The priests of the sick channel filth and sickness into the lands. Too late did we notice to stop them. You can though. Here, in the ocean, and the underwater city of the old. Go to those places and find the corruptions. Bring them to me.");
		}
	}
	sub EVENT_ITEM {
		#Kedge Cave Crystals, Ocean of Tears Seavines, Green Heartwood Branch
		if (($itemcount{20691} == 1) && ($itemcount{20692} == 1) && ($itemcount{20693} == 1)) {
			quest::say("Take my horn, symbol of Faydwer, now cleansed, to the gnome priest. It is anathema to him, to the corrupt forces in his soul, channeled into him by his dark god and will release the grip of corruption on the land. He is close, I can feel it");
			quest::summonitem(20694); #Gleaming Unicorn Horn
		} else {
			quest::emote("will not take this item.");
			plugin::return_items(\%itemcount);
		}
	}
}