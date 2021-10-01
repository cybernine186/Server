sub EVENT_SAY {
	if ($text=~/who is mistress anna/i) {
		quest::say("Mistress! Aptly named, that one. You are speaking of the Highpass hussy. That is what everyone calls her, at least behind her back, that is. Just as Highpass, she is beautiful and frequently traveled. I have heard rumors that Carson has been seeing her, but how can that be true? He has Lady McCabe. What else does he need?");
	}
	elsif ($text=~/highpass hussy/i) {
		quest::say("Looking for a good time, are we? You’d best leave that wench alone. Mistress Anna is said to be the sole property of Carson McCabe now.");
	}
	elsif ($text=~/who is lady mccabe/i) {
		quest::say("A stunning lady if I ever saw one. There is truly a rose missing from the garden of Erudin. Just look and do not touch. She is the spouse of Carson McCabe himself. How even he got a lady as beautiful as that is an amazement to us all.");
	}
	elsif ($text=~/where is lady mccabe/i) {
		quest::say("I would assume that she would be in the royal chambers in the highest levels of Highkeep.");
	}
	elsif ($text=~/who is carson mccabe/i) {
		quest::say("Carson McCabe is the ruler of Highpass Hold. It was his father, Sean McCabe who established this great community.");
	}
	elsif ($text=~/where is carson mccabe/i) {
		quest::say("Carson McCabe resides in the royal chambers of Highkeep. If you wish to meet with him, do so when he is on the lower levels of the keep. He does not like visitors in the upper levels.");
	}
	elsif ($text=~/highkeep lottery/i) {
		quest::say("The Highkeep Lottery is held every season. The Casino Treasurer, Lynn, handles all ticket sales and information. She can be found at the vault.");
	}
	elsif ($text=~/where is the vault/i) {
		quest::say("Inside the keep you can turn items in for holding at the vault clerk who is on the lower level beyond the guestrooms. Do not wander too far down there. The dungeon is also in the same area.");
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal '1' from /highkeep/Lartin.pl
	if ($signal == 1) {
		quest::say("Not at all. It is your life, sir.");
		#:: Send a signal '2' to High Keep >> Lartin (6186) with no delay
		quest::signalwith(6186, 2, 0);
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
