#druid and ranger epic handin
if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_ITEM {
		if ($itemcount{20458} == 1) {
			quest::say("You hardly look like the type of errand runner Farios usually sends out to fetch his groceries but here they are. I hope he chokes on them. Oh, and tell him he still owes me five gold for his last order!");
			quest::summonitem(20459);
		} else {
			quest::emote("will not take this item.");
			plugin::return_items(\%itemcount);
		}
	}
}