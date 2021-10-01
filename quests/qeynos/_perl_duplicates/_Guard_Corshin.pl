sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name!  Guard Corshin Kiniss, at your service. You should be careful in Qeynos after dark. We have had several [bodies] wash up under the docks over the past few weeks. We wouldn't want anything to happen to you.");
		#:: Send a signal "5" to South Qeynos >> Guard_Beren (1090) with no delay
		quest::signalwith(1090,5,0);
	}
	elsif ($text=~/bodies/i) {
		quest::say("We think the bodies are washing out of the aqueducts beneath Qeynos. It is a dangerous place to go and Commander Bayle refuses to send regular patrols down there.");
	}
}

sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/Lieutenant_Arathur.pl
	if ($signal == 1) {
		quest::say("Yes, sir!");
	}
	#:: Match signal "2" from qeynos/Guard_Beren.pl
	elsif ($signal == 2) {
		quest::say("Shhhhh. What are you, crazy?! I saw Kane talking to him yesterday. I sure don't want to find you washed up under the docks because of that little gnoll dropping.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
