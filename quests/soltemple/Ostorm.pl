sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I am Ostorm of the Temple of Solusek Ro, guardian of the sacred crystal of Kintaz.  Be wary and keep your distance, lest the proximity of the crystal [steal] your [memories].");
	}
	elsif ($text=~/steal my memories/i) {
		quest::say("It is the nature of the crystal of Kintaz to steal the memories of those around it. Only I am safe, and then only because of the strong wardings placed on me by Solusek Ro himself. Are you interested in [losing] any [memories]?");
	}
	elsif($text=~/losing my memories/i) {
		quest::say("Recently, I have been experimenting with the crystal, and have found that those exposed to ruby light filtered through it tend to lose the memories of their most specialized arcane skills. Are you sure you want to [lose advanced memory] of specialization?");
	}
	elsif ($text=~/lose advanced memory/i) {
		quest::say("Be warned that once exposed to the crystal, I can not reverse the effects. If you desire exposure, fetch me a ruby.");
	}
	elsif ($text=~/fifty gold/i) {
		quest::say("You do not remember?  You promised me fifty gold coins for allowing you to be exposed to the sacred crystal of Kintaz.");
	}
}

sub EVENT_ITEM {
	#:: Match 50 gold pieces
	if (plugin::takeCoin(0, 0, 50, 0)) {
		quest::say("Thank you.");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
	}
	#:: Match a 10035 - Ruby
	elsif (plugin::takeItems(10035 => 1)) {
		quest::say("..hear me? Ah, you seem to be coming out of your stupor. I think you have been exposed to the crystal long enough. By the time you leave the temple, your memories should have faded. Do you have the [fifty gold] coins that you owe me?");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		foreach $skill (43, 44, 45, 46, 47) {
			if ($client->GetSkill($skill) > 49) {
				$client->SetSkill($skill, 49);
			}
		}
		quest::me("Your specialize skills have all been set to 49.");
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 10000 - Lambent Stone, and two 10031 - Fire Opal
	elsif (plugin::takeItems(10000 => 1, 10031 => 2)) {
		quest::say("Here is your prize - a lambent fire opal.");
		#:: Give a 10128 - Lambent Fire Opal
		quest::summonitem(10128);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);	
	}
	#:: Match a 16507 - Enchanted Platinum Bar
	elsif (plugin::takeItems(16507 => 1)) {
		quest::say("Here is your magnetized platinum bar.");
		#:: Give a 19049 - Magnetized Platinum Bar
		quest::summonitem(19049);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
