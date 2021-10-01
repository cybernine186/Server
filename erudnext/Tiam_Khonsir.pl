sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings. $name. Are you a follower of our order. the Deepwater Knights. servants of the Ocean Lord. Prexus?");
		} if($text=~/yes i am/i){		
		quest::say("That is good. $name. Our followers are few but our faith is strong. With the efforts of those few. our destiny may be reached in time. We must walk with perseverence and devotion. much like the tides that. over time. can destroy a mighty stone cliff. Have you [come to serve our Lord]. $name?");	
		} if($text=~/i have come to serve our lord/i){	
		quest::say("Then I shall send you on a quest to prove your devotion. No doubt you have seen the vermin kobolds scuttling about the land as fleas upon a mangy dog. The kobolds have a lair on our continent from which they launch their wantonly destructive raids. You are to enter that lair and destroy as many of these dogs as you can. For each molar you bring me. you will receive praise. admiration. and perhaps some coin."); 	
		} if($text=~/quest of greater importance?/i){
		quest::say("'Very well then, you may be able to help us. Go to Breya and tell her I sent you. She will brief you.");
		}
	}
	sub EVENT_ITEM {
		#Kobold Molar
	if($itemcount{1761} == 1) {
		quest::say('Wonderful work, friend $name. One less land dwelling, flea ridden, primitive for our wondrous lord to sweep aside when the apocalypse is upon us. Here is your reward. Perhaps if you gather enough molars, we can offer you a [quest of greater importance].
		quest::givecash("12","14","5","0");
		quest::exp(100);
		quest::faction(79,10); #Deepwater Knights
		quest::faction(145,10); #High Council of Erudin
		quest::faction(143,-30); #Heretics		
		quest::givecash (12,14,5);	
	} 	
	plugin::return_items(\%itemcount);
}


#Script by: Puma.