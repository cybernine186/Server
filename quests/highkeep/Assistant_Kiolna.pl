sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello! I am Jaylin's new assistant, Kiolna. If you wish to hand in your keys, please give them to me and I will be happy to assist you! It is a pleasure doing business with you.");
	}
} 

sub EVENT_ITEM {
	#:: Match a 12143 - H.K. 102
	if (plugin::takeItems(12143 => 1)) {
		quest::say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
		#:: Give item 18936 - A Sealed Note *Zimels Letter from Hayle
		quest::summonitem(18936);
		#:: Ding!
		quest::ding();
		#:: Create a hash for storing cash - 80 to 500cp
		my %cash = plugin::RandomCash(80,500);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 12193 - H.K. 106  *Highkeep Strongbox 106
	elsif (plugin::takeItems(12193 => 1)) {
		quest::say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
		#:: Give item 13323 - Emerald Shard *Shard of Stormhammer II
		quest::summonitem(13323);
		#:: Ding!
		quest::ding();
		#:: Give a small amount of xp
		quest::exp(500);
		#:: Create a hash for storing cash - 200 to 900cp
		my %cash = plugin::RandomCash(200,900);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13823 - H.K. 401
	elsif (plugin::takeItems(13823 => 1)) {
		quest::say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
		#:: Give a 13828 - Staff Segment (Staff Segment B)
		quest::summonitem(13828);
		#:: Ding!
		quest::ding();
		#:: Give a small amount of xp
		quest::exp(500);
		#:: Create a hash for storing cash - 600 to 900cp
		my %cash = plugin::RandomCash(600,900);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
