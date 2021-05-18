sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Ah, greetings, $name!  How are you this evening?  Hopefully, you are faring much better than I..  I'm stuck on the night watch here, and never get to see my lovely [Aenia].  Ah..  she is so sweet..  I wrote her this beautiful [ballad], but I fear she may never hear it.");
	}
	elsif ($text=~/aenia/i) {
		quest::say("Aenia lives in North Qeynos in a little blue house near the Temple of Life with her overprotective father.  Last time he caught me there, he nearly killed me!");
	}
	elsif ($text=~/ballad/i) {
		quest::say("I wrote this little song for my dearest Aenia, but I can't sing it to her because I'm stuck here on watch duty.  You have a nice voice, $name, maybe you could go and sing my song to her for me, huh?  Just make sure you don't sing to Aenia when her father's around, 'cause like I said, he's already tried to kill me for seeing her.");
		#:: Give a 18026 - The Thornless Rose
		quest::summonitem(18026);
	}
}

sub EVENT_ITEM {
	#:: Match a 18027 - Letter to Behroe
	if (plugin::takeItems(18027 => 1)) {
		quest::say("Ah, thank you, kind $name.  You've made two foolish lovebirds very happy.  Please, take this..  Though it is not much, it will help keep you warm on those chilly Karana nights.  It is very good to have a friend such as yourself, and I will one day repay you for your kindness and generosity.");
		#:: Give a 1055 - Shawl of the Wind Spirit
		quest::summonitem(1055);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(284, 8);		#:: + League of Antonican Bards
		quest::faction(281, 1);		#:: + Knights of Truth
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(304, -1);	#:: - Ring of Scale
		quest::faction(285, -1);	#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(250);
	}
	#:: Match a 18021 - Jusean's Report Request
	elsif (plugin::takeItems(18021 => 1)) {
		quest::emote("yawns and says, 'Oh, report time already again?  Yeah, here ya go, $name.  Be careful around here at night, I've been seeing some rough looking characters lurking about.");
		#:: Ding!
		quest::ding();
		#:: Give a 18023 - Behroe's Report
		quest::summonitem(18023);
		#:: Set factions
		quest::faction(284, 10);	#:: + League of Antonican Bards
		quest::faction(281, 1);		#:: + Knights of Truth
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(304, -1);	#:: - Ring of Scale
		quest::faction(285, -1);	#:: - Mayong Mistmoore
		#:: Grant a small amount of experience
		quest::exp(250);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
