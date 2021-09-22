sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name. I invite you to serve the mighty state of Ak'Anon by becoming a Gemchopper. We gnomes are not known for our warrior skills, but those few who endure and survive to become elite amongst our warriors soon find that the technology of the gnomes has found its way into our halls. You must be a [new recruit] or [an outsider], perhaps?");
}
if($text=~/i am a new recruit/i){
quest::say("Well, good to make your acquaintance, $name. Maybe someday you shall be a great Watchman. Until then, I have a task for you. Will you [serve the Crown] or has a yellow streak appeared upon your back?");
}
if($text=~/i will serve the crown/i){
quest::say("You are too inexperienced. Leave that business to someone more worldly.");
}
if($text=~/i am an outsider/i){
quest::say("I should have guessed as much. You look the part."); }
}

sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 18770 => 1)){
	quest::summonitem("13520");
	quest::faction(255, 100); 	#:: + Gem Cutters
	#:: Ding!
	quest::ding();
	#:: Set faction
		quest::faction(288, 25); 	#:: + Merchants of Ak'Anon
		quest::faction(333, 25); 	#:: + King Ak'Anon
		quest::faction(238, -25); 	#:: - Dark Reflection
		quest::faction(1604, -5); 	#:: - Clan Grikbar
		#:: Grant a small amount of experience
		quest::exp(100);
	} else {
		plugin::traindiscs();
		plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:akanon  ID:55173 -- Baxok_Curhunter 

