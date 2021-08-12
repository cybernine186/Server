sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Ah, hello there, $name, and welcome to the Hall of Sorcery! I'm Daenor, a wizard of the Order of Three. I can help you practice your skills and learn some new ones.");
	}
	elsif ($text=~/neclo/i) {
		#:: Match if faction is better than indifferent
		if ($faction < 5) {
			quest::say("Neclo Rheslar is an old friend of mine. Right now, he's out working in the Qeynos Hills. In fact, if you have some free time, you should go out and meet him. Here, if you go, take this note to him for me. Thanks, friend.");
			#:: Give a 18823 - Note to Neclo
			quest::summonitem(18823);
		}
		else {
			quest::say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!");
		}
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
