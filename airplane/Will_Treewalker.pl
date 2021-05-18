sub EVENT_SPAWN {
	#:: Create a timer 'will_depop' that triggers every 300 seconds (5 min)
	quest::settimer("will_depop", 300);
}

sub EVENT_TIMER {
	#:: Match the timer 'will_depop'
	if ($timer eq "will_depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("The tests of old are difficult and dangerous, but the rewards for perseverance are great. I hold rewards for three tests. The test of the Wolf, test of the Bear and the test of the Tree.");
	}
	elsif ($text=~/test of the wolf/i) {
		quest::say("So you wish the test of The Wolf do you? Go forth unto the islands and find an Azure Tessera, Black Face Paint and finally a Worn Leather Mask. Bring them back to me, but not until you have all three and you shall be rewarded.");
	}
	elsif ($text=~/test of the bear/i) {
		quest::say("Ah, the test of The Bear It Is. Find In this plane a Copper Disc, a Sky Emerald and a Mantle of Woven Grass. Bring all three at one time to me for your reward.");
	}
	elsif ($text=~/test of the tree/i) {
		quest::say("The test of The Tree Is said to be a test of Nature and only those stout of limb and bark will succeed. Bring to me a Diaphanous Globe, some Hardened Clay and a Spiroc Battle Staff. Hand them all to me at once and the Reward will be yours.");
	}
}

sub EVENT_ITEM {
	#:: Match a 20930 - Azure Tessera, a 20728 - Black Face Paint, and a 20729 - Worn Leather Mask
	if (plugin::takeItems(20930 => 1, 20728 => 1, 20729 => 1)) {			#:: Druid Test of the Wolf
		quest::say("Good work, $name.");
		#:: Give a 2706 - Drake-Hide Mask
		quest::summonitem(2706);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20936 - Copper Disc, a 20731 - Mantle of Woven Grass, and a 20730 - Nature Walker's Sky Emerald
	elsif (plugin::takeItems(20936 => 1, 20731 => 1, 20730 => 1)) {			#:: Druid Test of the Bear
		quest::say("Good work, $name.");
		#:: Give a 2705 - Nature Walker's Mantle
		quest::summonitem(2705);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Match a 20943 - Diaphanous Globe, a 20732 - Hardened Clay, and a 20733 - Spiroc Battle Staff
	elsif (plugin::takeItems(20943 => 1, 20732 => 1, 20733 => 1)) {			#:: Druid Test of the Tree
		quest::say("Good work, $name.");
		#:: Give a 6411 - Shillelagh
		quest::summonitem(6411);
		#:: Ding!
		quest::ding();
		#:: Grant a huge amount of experience
		quest::exp(100000);
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
