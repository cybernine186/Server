sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say("Hello my friend. Good to meet you.");
	}
	if ($text=~/lens/i) {
		quest::say("Oh my. I have bad news. It was stolen by a dark elf rogue. She fled very quickly. My little legs could not keep up. Here, she dropped this. You must find her. Get it back. We have very few Lenses.");
		#:: Give a 18867 - Filthy Towel
		quest::summonitem(18867);
	}
}
