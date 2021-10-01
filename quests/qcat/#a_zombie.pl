sub EVENT_AGGRO {
	quest::say("Rele.. ase.. me.. from.. this.. tor.. ment.. ARGH! You will die for entering the domain of the Bloodsabers!! Karana.. help.. me?");
}

sub EVENT_ITEM {
	#:: Match a 18804 - Tattered Note
	if (plugin::takeItems(18804 => 1)) {
		quest::say("kill me... kill...me");
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("ARGH!!!!!.. Thank.. you..");
}
