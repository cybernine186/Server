# mechanical pen portion of enchanter epic quest lead-in
# 
if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_SAY {
	  if ($text=~/mechanical pen/i) {
		quest::say("Why do you want one of those contraptions. You will spend more time repairing it then you will writing with it. But if you insist on getting one, you are going to have to do a small favor.");
		quest::emote("tugs at your robe and grins evilly. 'Mighty nice outfit you have there. Sure beats these drab robes us three are wearing. Hmm...my favorite color is purple, in fact a shiny metallic purple would do nicely. How bad did you want that pen?'");
	  }
	}

	sub EVENT_ITEM {
	  if (plugin::check_handin(\%itemcount, 1360 => 1)) {
		quest::say("Very nice!! It is perfect! Here take this pen. Have fun with it.");
		quest::exp(50000);
		quest::summonitem(10600);
	  }
	  else {
		plugin::return_items(\%itemcount);
	  }
	}
}


sub EVENT_ITEM {
	#:: Match a 18703 - Old Folded Letter
	if (plugin::takeItems(18703 => 1)) {
		quest::say("Ah.. Welcome, friend! I am Tobon Starpyre, Master Wizard of Library Mechanimagica. This is our tunic - wear it with pride. Study hard, master your skills, and make us proud. Once you are ready to begin your training please make sure that you see Xalirilan, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		#:: Give item 13524 - Dark Gold Felt Robe*
		quest::summonitem(13524);
		#:: Ding!
		quest::ding();
		#:: Set faction
		quest::faction(240, -10); 		#:: - Deep Muses
		quest::faction(245, -10); 		#:: - Eldritch Collective
		quest::faction(238, 100); 		#:: + Dark Reflection
		quest::faction(255, -10); 		#:: - Gem Choppers
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
# EOF Zone: akanon ID: 55121 NPC: Rilgor_Plegnog

