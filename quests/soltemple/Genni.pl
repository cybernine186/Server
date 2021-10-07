sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("I am Genni of the temple of Solusek Ro. I serve as custodian of the [lambent stones].");
	}
	elsif ($text=~/lambent stones/i) {
		quest::say("Lambent stones are receptacles of power. Alone they are not useful, but when combined with other gemstones they can be used for making magic items. I know of [star ruby] lambent, [ruby] lambent, [sapphire] lambent and [fire opal] lambent.");
	}
	elsif ($text=~/ruby/i) {
		if ($text=~/star/i) {
			quest::say("To make a star ruby lambent stone, you must give me two star rubies and a lambent stone. Lambent stones can be found on hill giants, sand giants and griffons.");
		}
		else {
			quest::say("My Sister Vilissia holds the secrets to making ruby lambent stones. Though she will not speak of it, if you give her two rubies and a lambent stone, she will make you ruby lambent.");
		}
	}
	elsif ($text=~/sapphire/i) {
		quest::say("My Brother Gardern holds the secret to making sapphire lambent stones. Though he will not speak of it, if you give him two sapphires and a lambent stone, he will make you sapphire lambent.");
	}
	elsif ($text=~/fire opal/i) {
		quest::say("My Brother Ostorm holds the secret to making fire opal lambent stones. Though he will not speak of it, if you give him two fire opals and a lambent stone, he will make you fire opal lambent. If you are interested, I can [sell] you a [fire opal].");
	}
	elsif ($text=~/sell/i) {
		quest::say("I will sell you a fire opal for 550 golden coins. Remember, gold! The metal of fire for a gem of fire.");
	}
}

sub EVENT_ITEM {
	#:: Match five hundred fifty gold pieces
	if (plugin::takeCoin(0, 0, 550, 0)) {
		quest::say("Here is your prize - a lambent fire opal.");
		#:: Give a 10031 - Fire Opal
		quest::summonitem(10031);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match two 10032 - Star Ruby, and a 10000 - Lambent Stone
	elsif (plugin::takeItems(10032 => 2, 10000 => 1)) {
		quest::say("Here is your prize - a lambent star ruby.");
		#:: Give a 10117 - Lambent Star Ruby
		quest::summonitem(10117);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 1);			#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 16507 - Enchanted Platinum Bar
	elsif (plugin::takeItems(16507 => 1)) {
		quest::say("I see that Gavel has sent you to me. Very well, I have galvanized your platinum bar - take it.");
		#:: Give a 19047 - Galvanized Platinum Bar
		quest::summonitem(19047);
		#:: Ding!
		quest::ding();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
