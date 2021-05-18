sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello, $names.  My name is Bren Treeclimber and I am a Protector of the Pine.  We have sworn our lives to protecting all the animals of Surefall Glade.  [Poachers], beware!");
	}
	elsif ($text=~/poachers/i) {
		quest::say("Heh?  Oh.  Poachers are constantly after our bears for their valuable skins.  I wish those darn [Millers] would move on. Then, maybe, our bears would be left alone.  I have seen far too many of my friends die.  I will kill anyone I see harming my bears.");
	}
	elsif ($text=~/millers/i) {
		quest::say("The Millers?!  Those butchers!  We have caught that Baobob and his sister trying to poach more than once.  And to think we took them in and gave them shelter when they were in need.  All the while, they were just trying to get to our bears.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 130) {
		#:: Set running true (run)
		quest::SetRunning(1);
	}
	elsif ($wp == 216 ) {
		#:: Set running false (walk)
		quest::SetRunning(0);
	}
	elsif ($wp == 258 ) {
		quest::say("Hey there, big bear! Good bear! Keep clear of those mean ol' poachers.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
