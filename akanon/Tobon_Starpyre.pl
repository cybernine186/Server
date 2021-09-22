################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Tobon_Starpyre         #                             
#NPC ID: 55130                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is good to see the young show an interest in the ways of magic. Its circles can be used in tandem with our unique ways of tinkering. Have you [joined the Eldritch Collective] or are you [merely curious]?");
}
if($text=~/I am merely curious/i){
quest::say("Please look around. We have much knowledge within these halls. May you soon find your place among our members. Good day.");
}
if($text=~/I have joined the Eldritch Collective/i){
quest::say("Very good. Would you like to [go on a little mission] or are you busy studying?");
}
if($text=~/I will go on a little mission/i){
quest::say("Fabulous! Here is a list of the observers outside of Ak'Anon. Go and ask each for a [spare telescope lens]. Each should give you one. We have need of them.  I await your return as does your reward, either Fire Bolt or Fingers of Fire.  Meant for a skilled wizard of the eighth trial.");
quest::summonitem("18868"); }
sub EVENT_ITEM {
	#:: Match a 18774 - Registration Letter
	if (plugin::takeItems(18774 => 1)) {
		quest::say("Ah.. Welcome, friend! I am Tobon Starpyre, Master Wizard of Library Mechanimagica. This is our tunic - wear it with pride. Study hard, master your skills, and make us proud. Once you are ready to begin your training please make sure that you see Xalirilan, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		#:: Give item 13523 - Soot Stained Gold Robe*
		quest::summonitem(13523);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(240, -5); 		#:: - The Dead
		quest::faction(245, 100); 		#:: + Eldritch Collective
		quest::faction(238, -15); 		#:: - Dark Reflection
		quest::faction(255, 15); 		#:: + Gem Choppers
		quest::faction(333, 15); 		#:: + King Ak'anon
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Match a 13275 - Telescope Lens, a 13276 - Telescope Lens, a 13277 - Telescope Lens, and a 13279 - Telescope Lens
	elsif (plugin::takeItems(13275 => 1, 13276 => 1, 13277 => 1, 13279 => 1)) {
		quest::say("Thank you for your work. I heard news of the troubles you encountered. Besides these troubles you still completed your mission. We are grateful. And as I once stated, your reward awaits.");
		#:: Give a random reward: 15380 - Spell: Column of Frost, 15477 - Spell: Fire Bolt, 15656 - Spell: Shock of Ice
		quest::summonitem(quest::ChooseRandom(15380, 15477, 15656));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(240, -5); 		#:: - The Dead
		quest::faction(245, 100); 		#:: + Eldritch Collective
		quest::faction(238, -15); 		#:: - Dark Reflection
		quest::faction(255, 15); 		#:: + Gem Choppers
		quest::faction(333, 15); 		#:: + King Ak'anon
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 900 to 1100cp
		my %cash = plugin::RandomCash(900,1100);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
 

