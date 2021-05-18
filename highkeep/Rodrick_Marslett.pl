sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Oooh.. Hello, [guard]. Please do not let the [Teir'Dal] at me again. I can take no more.");
	}
	if ($text=~/Teir'Dal/i) {
		quest::say("The Teir'Dal are what all elves call the dark elves, such as those vile torturers. I don't know what they are doing in Highpass.");
	}
	if ($text=~/guard/i) {
		quest::say("Then what are you doing down here? Leave before they shackle you to this cage or strap you to the operating table!");
	}
	if ($text=~/fenn kaedrick/i) {
		quest::say("Are you searching for the rogue named Fenn Kaedrick? He used to be locked in here with me. That Lady McCabe bailed him out just minutes before the Teir'Dal planned to operate on him. He said that if I ever did escape, to venture to the very roof of this keep and wait till he showed up to escort me away from here.");
		#:: Spawn a High Keep >> Fenn_Kaedrick (6184)
		quest::spawn2(6184,0,0,-87,2,66,128);
	}
}
	
sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
