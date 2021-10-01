sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome to the Shrine of the Diseased! You will be repaid for your service when your soul crosses the void into Bertoxxulous' waiting arms. Are you available to [do His bidding], or are you [too busy]?");
	}
	elsif ($text=~/do his bidding/i) {
		quest::say("That is good.  We need you to go and speak with [Commander Kane Bayle] of the Qeynos Militia.  You will find him at the gatehouse.  Tell him that the disease is spreading.  Now go.");
	}
	elsif ($text=~/too busy/i) {
		quest::say("Then be off and spread the disease.");
	}
	elsif ($text=~/commander kane bayle/i) {
		quest::say("Commander Kane Bayle is a new member of the Shrine of Bertoxxulous.  He will assist us in turning the city of Qeynos from thunder to plague.");
	}
}

sub EVENT_ITEM {
  	#:: plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  	#:: Return unused items
	plugin::returnUnusedItems();
}
