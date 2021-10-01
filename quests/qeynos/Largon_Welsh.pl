sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Grab a pole and start fishing. You never know what you will catch. Rohan is offering a reward for some fish. Dead or alive!");
	}
	elsif ($text=~/prexus/i) {
		quest::say("What are you babbling about? You sound like that fisherman Masterson. He talks of Prexus from time to time. I guess he used to be a follower or something.");
	}
	elsif ($text=~/masterson/i) {
		quest::say("Masterson? Lately, I hear he has been spending a lot of time fishing in the catacombs underneath Qeynos. Must be at night when his wife is asleep. Ha!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
