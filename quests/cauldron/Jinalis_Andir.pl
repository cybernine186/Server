#Zone: Dagnor's Cauldron
#Short Name: cauldron
#Zone ID: 70
#
#NPC Name: Jinalis Andir
#NPC ID: 70028
#Magician Epic Quest

if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_SAY {
		if ($text=~/hail/i) {
			quest::say("Let us dispense with pleasantries, $name. I am Jinalis, as you know. I imagine you want to control the Elements. The Element of Water, which I possess, is the most powerful of the Elements. With it you can control the water which falls from the Air, erodes the Earth, and extinguishes Fire. It is a pity you do not focus on the Prime Element, but if you wish to follow that fool Magi'kot to your doom, I will not stop you. Bring me the Staff of Elemental Mastery: Water held by the last of the Kedge, the Tears of Erollisi held by a dirty and rotten officer across the Blessed Deep, and finally, the Rain of Karana, found on a mighty Giant in, where else, the Karanas.");
		}
	}
	
	sub EVENT_ITEM {
		#Staff of Elemental Mastery: Water, Rain of Karana, Tears of Erollisi
		if (($itemcount{11569} == 1) && ($itemcount{28040} == 1) && ($itemcount{28041} == 1)) {
			quest::say("You have the control needed in order to manipulate the water which surrounds us. Take this Element and guard it well, you will need it in the times to come.");
			quest::summonitem(28006); #Elements of Water
			quest::exp(3000);
		} else {
			quest::say("I do not need these.");  
			plugin::return_items(\%itemcount);
		}
	}
}
#END of FILE Zone: cauldron ID:70028 -- Jinalis_Andir