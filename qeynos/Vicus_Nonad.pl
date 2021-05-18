sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.  My name is Vicus Nonad. <cough>  I am the official tax collector for the fine city of Qeynos. <cough>  I serve the will of Antonius Bayle, our glorious leader.  <cough>  <cough>  Please excuse my [cough].  <cough>");
	}
	elsif ($text=~/cough/i) {
		quest::say("Oh, <cough> I am sorry, but it seems I have fallen a bit ill.  I was caught out in the rain the other day and my chills have gotten the best of me. <cough>  If only someone would [help with today's collections]..  <cough>");
	}
	elsif ($text=~/help with today's collections/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Set a data bucket, quest started
		quest::set_data($key, 1);
		quest::say("Oh thank <cough> you so <cough> <cough> much <cough>..  Here is the official collection box.  Please collect from each merchant on the <cough> [list].  Then bring me back the combined total of all your collections.");
		#:: Give a 17012 - Tax Collection Box
		quest::summonitem(17012);
	}
	elsif ($text=~/list/i) {
		quest::say("Oh.  <cough>  I am sorry..  I forgot to give it to you.  Here you go.  Be sure to give that back when your job is finished.  <cough>");
		#:: Give a 18009 - List of Debtors
		quest::summonitem(18009);
	}
}

sub EVENT_SPAWN {
	#:: Set a timer "cough" to repeat every 350 seconds (5 min 50 sec)
	quest::settimer("cough",350);
}

sub EVENT_TIMER {
	#:: Match the "cough" timer
	if ($timer eq "cough") {
		quest::emote("coughs and wheezes.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18009 - List of Debtors and 13181 - Full Tax Collection Box
	if (plugin::takeItems(13181 => 1, 18009 => 1)) {
		quest::say("<cough> Great! Thank you so much. Here is a small gratuity for a job well done. Thank you again. <cough> Antonius Bayle and the People of Qeynos appreciate all yo have done.");
		#:: Delete the data bucket
		$key = $client->CharacterID() . "-tax-collection";
		quest::delete_data($key);
		#:: Give a random reward: 13053 - Brass Ring, 10010 - Copper Amulet, 10018 - Hematite, 10017 - Turquoise
		quest::summonitem(quest::ChooseRandom(13053, 10010, 10018, 10017));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(219,10);		#:: + Antonius Bayle
		quest::faction(262,4);		#:: + Guards of Qeynos
		quest::faction(304,-5);		#:: - Ring of Scale
		quest::faction(273,-10);	#:: - Kane Bayle
		quest::faction(291,10);		#:: + Merchants of Qeynos
		#:: Grant a small amount of experience
		quest::exp(500);
		#:: Create a hash for storing cash - 200 to 300cp
		my %cash = plugin::RandomCash(200,300);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 13181 - Full Tax Collection Box
	elsif (plugin::takeItems(13181 => 1)) {
		quest::say("Very good <cough> work. But I need both the full tax collection box and the list of debtors. You did get the [list] from me before you left, right? <cough>");
		#:: Return a 13181 - Full Tax Collection Box
		quest::summonitem(13181);
	}
	#:: Match a 18009 - List of Debtors
	elsif (plugin::takeItems(18009 => 1)) {
		quest::say("Very good <cough> work. But I need both the full tax collection box and the list of debtors. You did get the [list] from me before you left, right? <cough>");
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
