#:: Create a scalar variable to store coin state
my $coinoperated = 0;

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Raise your guard! It's time to test your skills.");
	}
}

sub EVENT_SPAWN {
	#:: Create a timer to trigger in 30 minutes
	quest::settimer("depop", 1800);
	#:: Set scalar to 0
	$coinoperated = 0;
}

sub EVENT_TIMER {
	if ($timer eq "depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
}


sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("What brings you to the top of the castle? Me? I am just the Highkeep exterminator. We have had a nasty time with rats.");
	}
	elsif ($text=~/xentil herkanon/i && $coinoperated == 1) {
		quest::say("Xentil Herkanon is related to one of the bigwigs of the Circle of Unseen Hands, the rogue guild in Qeynos. Killing him would greatly decrease your popularity with them, but who do they like, anyway? He travels with two bodyguards, Lartin and Grex, very tough customers. It's best to avoid them. Goodbye and good luck.");
		#:: Spawn a High Keep >> Xentil_Herkanon (6185)
		quest::unique_spawn(6185, 0, 0, -256, -99, 3.75, 40);
		#:: Spawn a High Keep >> Lartin (6186) on grid 11
		quest::unique_spawn(6186, 11, 0, -212, -54, 3.75, 471);
		#:: Spawn a High Keep >> Grex (6187) on grid 10
		quest::unique_spawn(6187, 10, 0, 23, -28, -2.25, 384);
		quest::stoptimer("depop");
		quest::depop();
	}
}

sub EVENT_ITEM {
	#:: Match a 12185 - Useless Token
	if (plugin::takeItems(12185 => 1)) {
		quest::say("So you are the one Laren sent. I myself was trained by Laren. Imagine that, a human trained by elven rogues. I share the concerns of the scouts. You were sent to assassinate [Xentil Herkanon]. He betrayed the scouts and Kelethin. He is somewhere in this keep. Return his head to Laren in Kelethin.");
		#:: Ding!
		quest::ding();
		#:: Grant a moderate amount of experience
		quest::exp(2000);
		#:: Set scalar to 1
		$coinoperated = 1;
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("You have won this battle, my friend, but my fellow rogues will learn of this and you shall pay dearly.");
}
