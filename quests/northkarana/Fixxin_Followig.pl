sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name! Fixxin is my moniker. Nice ta see ya. I am a member of the [Fangbreakers] and we are hunting [werewolves]. We run into lots of other [creepies] out here as well.");
	}
	elsif ($text=~/fangbreakers/i) {
		quest::say("Fangbreakers? You have not heard of us? We are the best [werewolf] hunters there are!");
	}
	elsif ($text=~/werewolf|werewolves/i) {
		quest::say("Those blasted fiends hide among normal folk during the day, but at night their bloodlust is set free on an innocent populace. Some claim there is a cure for their condition but the only one we know of is an [enchanted blade] through the bellies of the beasts.");
	}
	elsif ($text=~/enchanted blade/i) {
		quest::say("Interested in an enchanted blade? You wouldn't be planning on hunting the moon beasts without a strong, well-oiled party to back you up, now, would you? Well, in any case, I'll gladly lend you a copy of my book, Fixxin Followigs Silvery Blades, if you will fetch me a bar of silver. My supply is running low and our weapons are in need of repair after the deaths of so many lycanthropes.");
	}
	elsif ($text=~/creepies/i) {
		quest::say("Besides the occasional werewolf, we also tend to run across many griffons and hill giants out this way. Those giants can be bruisers but against a trained team such as we, they don't stand a chance. Especially with my enchantments protecting us.");
	}
}

sub EVENT_ITEM {
	#:: Match a 16500 - Silver Bar
	if (plugin::takeItems(16500 => 1)) {
		quest::emote("thanks $name heartily. 'Here is the book as promised. I wish you luck with your enchanted weapons. May they slay many lycanthropes before they go dull.'");
		#:: Give a 18178 - Fixxin Followigs Silvery Blades
		quest::summonitem(18178);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(345, 1);		#:: + Karana Residents
		quest::faction(262, 1);		#:: + Guards of Qeynos
		quest::faction(341, 1);		#:: + Priests of Life
		quest::faction(280, 1);		#:: + Knights of Thunder
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("My comrades will avenge my death.");
}
