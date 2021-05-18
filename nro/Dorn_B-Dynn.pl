sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Just who are you? Do you expect some sort of courteous greeting? I have no time for idle chitchat!! Either you are here to [attend to business] or you [seek shelter], which is it?");
	}
	elsif ($text=~/attend to business/i) {
		quest::say("So, business is your mission! I have never met you. Who sent you?");
	}
	elsif ($text=~/seek shelter/i) {
		quest::say("Then look else where!! You are lucky your head still sits upon your shoulders. The dervish cutthroats are not fond of strangers. Now leave!");
	}		
	elsif ($text=~/zimbittle/i) {
		quest::say("I do not know if I could trust you. You certainly do not look as though you are from Grobb, although your stench does hint of that place. If you are truly sent by Zimbittle, what is the password?");
	}	
	elsif ($text=~/mukk/i) {
		#:: Match if faction is Amiable or better - No response if Indifferent or worse
		if ($faction <= 4 ) {
			quest::say("So you were sent by Zimbittle. Take this note to Kraagia of Da Bashers in Grobb. Do not lose the note. If it were to fall into the wrong hands of [Goonda], this whole plan could be disrupted. Now, leave, I can no longer tolerate you foul stench!");
			#:: Give a 18886 - A Sealed Letter (Letter from The Dead)
			quest::summonitem(18886);
		}
	}
	elsif ($text=~/goonda/i) {
		quest::say("In the western planes of Karana, you will find Goonda. He seems to be the Ogre shaman in charge out there.");
	}		
} 

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
