sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello, $name, I am Unsar, student of Mespha. I am working on a spell. . . I call it [Unsar's Glory]. Great name, huh?");
	}
	elsif ($text=~/glory/i) {
		quest::say("Ah, Unsar's Glory. . . Mind you, I haven't perfected it yet, but bring me some rat whiskers, snake scales, and two bat wings, and I'll show you how it works.");
	}
}

sub EVENT_ITEM {
	#:: Match 13071 - Rat Whiskers, 13070 - Snake Scales and two 13068 - Bat Wing
	if (plugin::takeItems(13071 => 1, 13070 => 1, 13068 => 2)) {
		quest::say("All right, check this out. . . Maybe one day you'll be good enough to do this, too");
		#:: Choose a random spell: 206 - Angry Bee, 214 - Ground Bloom Flower, 310 - Flare, 2186 - The Anti-Gulper, 2728 - Portal Effect
		my $randomspell = quest::ChooseRandom(206, 214, 310, 2186, 2728);
		#:: Cast the spell
		$npc->CastSpell($randomspell,$caster_id);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(342, 5);		#:: + Order of Three
		quest::faction(221, -5);	#:: - Bloodsabers
		quest::faction(262, 5);		#:: + Guards of Qeynos
		quest::faction(296, -5,);	#:: - Opal Darkbriar
		quest::faction(291, 5);		#:: + Merchants of Qeynos
		#:: Grant a small amount of experience
		quest::exp(200);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
