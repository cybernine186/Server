sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Pleasure to meet you, %s. What brings you to High Hold? You do not appear to be the gambling type. Then again, you are speaking with me. That is quite a gamble in itself. I just love high rollers. Really, I do!");
	}
	elsif ($text=~/staff/i) {
		quest::say("I have no idea what you are talking about. Battle staff.. Hmmm.. No, it does not ring a bell.");
	}
	elsif ($text=~/mistress anna/i) {
		quest::say("The Highpass hussy? I don't think you are rich enough to attract her affections. She would search for other requirements if she were... a lady. But she is a blatant trollop! I would have her executed if Carson would allow me. She is some sort of friend to Carson. <rolls eyes> Hmph! Grrrrr!");
	}
	elsif ($text=~/carson/i) {
		quest::say("You do not know who Carson McCabe is?! No wonder you dare to speak with me! You know what they say, 'Those who dare, win!'");
	}
	elsif ($text=~/you are/i) {
		quest::say("You really know all the right things to say. If only I'd never married Carson.");
	}
}

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Guards! Guards! Help me!");
	}
}
