sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Me hear dat dere are humans, elves and other weaklings hunting in da swamp.");
	}
	elsif ($text=~/have you seen the captain/i) {
		quest::say("The bone captain? Him funny ting. Him ask me where ta find a boat. Me says me seen wun up north, but it not so gud boat. Lotsa holes. He go anyway. Mebbe him sink, mebbe not.");
		#:: Spawn a Innothule Swamp >> a_skeleton (46109)
		quest::spawn2(46109,0,0,800,-1640,-23.09,0);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
