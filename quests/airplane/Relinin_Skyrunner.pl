sub EVENT_SPAWN {
	#:: Create a timer 'relinin_depop' that triggers every 300 seconds (5 min)
	quest::settimer("relinin_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'relinin_depop'
	if ($timer eq "relinin_depop") {
		quest::stoptimer("relinin_depop");
		quest::depop();
	}
} 

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings $name. I can only assume my reasons for being summoned is that you wish to take the tests. Would you like to be tested in the body, in defense, or in the element of earth?");
	}
	elsif ($text=~/body/i) {
		quest::say("Very well. You must scour this plane and bring back to me these components: an auburn tessera, a ysgaril root, and a griffon talon. Make haste, and good luck.");
	}
	elsif ($text=~/defense/i) {
		quest::say("Defense it is. You must prove yourself worthy enough for the Spiroc spirits to guard you. Bring back to me a mithril disc, a harpy tongue, and a fine velvet cloak. Good luck to you $name.");
	}
	elsif ($text=~/element of earth/i) {
		quest::say("Elemental earth you say? When honed, the elements can be among our best allies. Retrieve a gridelin globe, a dragon hide mantle, and a spiroc earth totem. Only with these items can you master the element of earth.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20934 - Auburn Tessera, a 20850 - Griffon Talon, and a 20849 - Ysgaril Root
	if (plugin::takeItems(20934 => 1, 20850 => 1, 20849 => 1)) {			#:: Ranger Test of Body
		quest::say("Good work, ranger.");
		#:: Give a 2715 - Spiroc Healer's Cloak
		quest::summonitem(2715);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20853 - Fine Velvet Cloak, a 20852 - Harpy Tongue, and a 20851 - Mithril Disc
	elsif (plugin::takeItems(20853 => 1, 20852 => 1, 20851 => 1)) {			#:: Ranger Test of Defense
		quest::say("Good work, ranger.");
		#:: Give a 27731 - Dark Cloak of the Sky
		quest::summonitem(27731);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20854 - Dragon-hide Mantle, a 20948 - Gridelin Globe, and a 20855 - Spiroc Earth totem
	elsif (plugin::takeItems(20854 => 1, 20948 => 1, 20855 => 1)) {			#:: Ranger Test of the Element of Earth
		quest::say("Good work, ranger.");
		#:: Give a 2714 - Earthshaker's Mantle
		quest::summonitem(2714);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
