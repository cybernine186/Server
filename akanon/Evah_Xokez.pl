################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Evah_Xokez             #                             
#NPC ID: 55124                    #
#Quest Status: incomplete         #                                      
###################################
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Be wary, $name, there are unseen powers within these mines that can destroy the strongest warriors or the wisest seers. Do you find the rust that corrodes the mechanisms around you and the decaying forms that wander [these tunnels pleasing]?");
}
if($text=~/I find these tunnels pleasing/i){
quest::say("Then perhaps you share the vision of we who have made these mines our home. We are the Dark Reflection and our perceptions have been refined to allow us to see the poisons and disease coursing through every creature's veins and the decay afflicting all forms of matter in Norrath. I can teach you to harness the powers of our divine benefactor if you are [willing to learn] through service to the Dark Reflection."); 
}
if($text=~/I am willing to learn/i){
quest::say("Then your first lesson shall be the fulfillment of spreading infection and disease. Some of the best carriers of infectious diseases are rodents. Take this vial containing a slow and painful infection and give it to one of the pregnant giant rodents that can be found outside in the Steamfont Mountains. This way you can spread the disease to not only those creatures which cross the mother's path but also to those who cross the paths of her future offspring. Bring me the empty vial when the task has been completed.");
quest::summonitem(10262);
}
if($text=~/What components/i){
quest::say("The recipe we use to make the plague rat disease is fairly simple. We could easily extract the fluids from the infected rat livers but that would be counterproductive to our cause since it would require the deaths of our rodent carriers. Instead, I need you to collect two parts diseased bone marrow, one sprig of wormwood and one part gnomish spirits to be used as a medium. When you have combined all the components in the container I have provided, return it to me so that we may continue to spread the disease!"); }
}
sub EVENT_ITEM {
if($item1=="10263"){
quest::say("I hope you enjoyed the thrill of your first lesson and the awakening of your vision. Now you must prove your utility to our society. Take this airtight container and gather the [components] for another dose of the plague rat disease.");
		#:: Give a 17357 - Airtight metal box
		quest::summonitem(17357);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(238, 3); 		#:: + Dark Reflection
		quest::faction(245, -3); 		#:: - Eldritch Collective
		quest::faction(255, -3); 		#:: - Gem Choppers
		quest::faction(240, -3); 		#:: - Deep Muses
		#:: Grant a small amount of experience
		quest::exp(150);
}
sub EVENT_ITEM {
if($item1=="10266"){
quest::say("It appears that you truly seek to expand your vision into the Dark Reflection, $name. I grant you the Initiate Symbol of Bertoxxulous!");
		#:: Give  1390 - Initiate Symbol of Bertoxxulous
		quest::summonitem(1390); 
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(238, 3); 		#:: + Dark Reflection
		quest::faction(245, -3); 		#:: - Eldritch Collective
		quest::faction(255, -3); 		#:: - Gem Choppers
		quest::faction(240, -3); 		#:: - Deep Muses
		#:: Grant a small amount of experience
		quest::exp(150);
}

