sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Why, hello there, $name! I am Jusean, loyal member of the League of Antonican Bards. You look like the reliable sort, maybe you could help me out for a bit, huh? It's about time for our field agents to turn in their [watch reports], and I need someone to go pick them up for me.");
	}
	elsif ($text=~/watch reports/i) {
		quest::say("We always have someone stationed on watch duty at the two main entries to the city to keep an eye on what is happening around Qeynos. We have [Anehan and Behroe] down at the docks, and [Leanon and Quinon] working the North Gate.");
	}
	elsif ($text=~/anehan and behroe/i) {
		quest::say("Here, if you take this to Anehan or Behroe down at the docks, and then return their report to me as soon as you can, I will give you a small reward.");
		#:: Give a 18021 - Jusean's Report Request
		quest::summonitem(18021);
	}
	elsif ($text=~/leanon and quinon/i) {
		quest::say("Leanon is in charge of the day shift at the North Gates of Qeynos, and Quinon is stationed there during the night. Please take this to either of them, have them fill it out, and then return it to me as soon as you can.");
		#:: Give a 18020 - Jusean's Report Request
		quest::summonitem(18020);
	}
#########:: LoY-era quest
#	elsif ($text=~/father/i) {
#		quest::say("My father Heltin disappeared while on a voyage aboard the Sea King. A group of troll pirates attacked and boarded the ship. Ginleen Harltop and the steel warriors traveling with them managed to fight them off, but took many casualties. My father was one of the bodies that was not accounted for. They found his song book floating in the water near the boat. The red water soaked through it's pages told more of the story then I ever care to know.");
#	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match when NPC arrives at waypoint 3
	if ($wp == 3) {
		quest::emote("growls, revealing his fangs.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18023 - Behroe's Report
	if (plugin::takeItems(18023 => 1)) {
		quest::say("Good job. I hope Behroe wasn't sleeping on the job again when you talked to him. Hmm, the docks seem to be a hotbed of activity after the sun goes down. Thanks for your quick work, $name, here's a little cash for your efforts.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 25);	#:: + League of Antonican Bards
		quest::faction(281, 3);		#:: + Knights of Truth
		quest::faction(262, 3);		#:: + Guards of Qeynos
		quest::faction(304, -1);	#:: - Ring of Scale
		quest::faction(285, -1);	#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 10 to 20cp
		my %cash = plugin::RandomCash(10,20);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 18022 - Anehan's Report
	elsif (plugin::takeItems(18022 => 1)) {
		quest::say("Ok, good work, $name. I'll make sure to note the day's activities in our journal. Here's a little something for your efforts.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 25);	#:: + League of Antonican Bards
		quest::faction(281, 3);		#:: + Knights of Truth
		quest::faction(262, 3);		#:: + Guards of Qeynos
		quest::faction(304, -1);	#:: - Ring of Scale
		quest::faction(285, -1);	#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 10 to 20cp
		my %cash = plugin::RandomCash(10,20);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 18024 - Leanon's Report
	elsif (plugin::takeItems(18024 => 1)) {
		quest::say("Ah, very good. I'll make sure to note Leanon's report in our journals. Here's a little something for your troubles, $name.");			
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 10);	#:: + League of Antonican Bards
		quest::faction(281, 1);		#:: + Knights of Truth
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(304, -1);	#:: - Ring of Scale
		quest::faction(285, -1);	#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 10 to 20cp
		my %cash = plugin::RandomCash(10,20);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}		
	#:: Match a 18025 - Quinon's Report
	elsif (plugin::takeItems(18025 => 1)) {
		quest::say("Hmm... interesting... good work, $name, thank you for your help.");			
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 10);	#:: + League of Antonican Bards
		quest::faction(281, 1);		#:: + Knights of Truth
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(304, -1);	#:: - Ring of Scale
		quest::faction(285, -1);	#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 10 to 20cp
		my %cash = plugin::RandomCash(10,20);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}					
#########:: LoY-Era Quest
#	#:: Match a 59023 - Faded Songbook
#	elsif (plugin::takeItems(59023 => 1)) {					
#		quest::emote("peers intently through several pages of the book, mumbling quietly under his breath as he does. His gaze falls on one page in particular as his eyes begin to widen as they pass over each line. He begins scribbling frantically across the pages in between the lines.");
#		quest::say("Take this, who ever wrote it was obviously a student of my father. The style is unmistakable. I've written some notes up for you so it should be easier to read. Take this back to Kardin and he'll teach it to you.");
#		#:: Give a 59024 - Transcribed Songbook
#		quest::summonitem(59024);
#		#:: Ding!
#		quest::ding();
#		#:: Set factions
#		quest::faction(284, 10);	#:: + League of Antonican Bards
#		quest::faction(281, 10);	#:: + Knights of Truth
#		quest::faction(262, 10);	#:: + Guards of Qeynos
#		quest::faction(304, -30);	#:: - Ring of Scale
#		quest::faction(285, -30);	#:: - Mayong Mistmoore
#		#:: Grant a moderate amount of experience
#		quest::exp(2500);
#	}
#	#:: Match a 59042 - Stained Parchment
#	elsif (plugin::takeItems(59042 => 1)) {	
#		quest::say("My father gave you this just before he died?! So he's been alive all these years in the mines of Brokenskull Rock. What a bitter end for such a talented minstrel. I will transcribe this song for you $name, but you must promise to use it to help those like my father, trapped in an unnatural insanity. I pray that you will not fall to the same fate.");
#		#:: Give a 59001 - Song: Aria of Innocence
#		quest::summonitem(59001);
#		#:: Ding!
#		quest::ding();
#		#:: Set factions
#		quest::faction(284, 10);	#:: + League of Antonican Bards
#		quest::faction(281, 10);	#:: + Knights of Truth
#		quest::faction(262, 10);	#:: + Guards of Qeynos
#		quest::faction(304, -30);	#:: - Ring of Scale
#		quest::faction(285, -30);	#:: - Mayong Mistmoore
#		#:: Grant a moderate amount of experience
#		quest::exp(2500);
#	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
