sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings!!  Welcome to Highkeep. home of the greatest casino in all of Norrath.  Please visit our fine casino on the second floor.");
	}
	if ($text=~/highkeep lottery/i) {
		quest::say("Interested in the Highkeep lottery, are we?  I am afraid it as been put on hold.  We found last season's winner to be holding a counterfeit ticket.  We now await [last season's winner] to step foward with the winning ticket - ticket number 16568.  His prize is the key to the royal suite.");
	}
	if ($text=~/last season's winner/i) {
		quest::say("Last season's winner is not known.  I have heard from my sources that he was some sort of merchant of used goods.");
	}
}

sub EVENT_ITEM {
	#:: Turn in for 12261 -  Lottery Ticket # 15600
	if (plugin::check_handin(\%itemcount, 12261 => 1)) {
		quest::say("You have the runner up ticket from last season!! Here is your reward. Remember, a copper gambled is a plat earned!!");
		#:: Give a small amount of xp
		quest::exp(500);
		#:: Ding!
		quest::ding();
		#:: Give a small amount of cash copper - plat
		quest::givecash(10,11,16,0);
	}
	#:: Turn in for 12266 -  Lottery Ticket # 16568
	if (plugin::check_handin(\%itemcount, 12266 => 1)) {
		quest::say("Congratulations!! You are the winner of last season's Highkeep lottery. Here is the key to the royal suite. You should find this room on the third floor.");
		#:: Give item 12267 - Highkeep Royal Suite
		quest::summonitem(12267);
		#:: Give a small amount of xp
		quest::exp(500);
		#:: Ding!
		quest::ding();
	}
	plugin::return_items(\%itemcount);
}
