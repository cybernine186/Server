sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, child. Welcome to Gemchopper Hall. I trust that you are a [warrior], or perhaps you are [lost]..?");
	}
	elsif ($text=~/lost/i) {
		quest::say("One can easily get lost in Ak'Anon. You must get your vision checked. If you are truly lost, I would advise speaking with a mechanical guide. There should be one close by on the main walkway.");
	}
	elsif ($text=~/warrior/i) {
		quest::say("That is good news! We gnomes are not known for our love of battle so it is always good to bring new blood into our ranks. We shall prove our worth as warriors to all other races. For now. there is much to do in Ak'Anon. There are [rogue clockworks] and the [cargo clockwork].");
	}
	elsif ($text=~/rogue clockworks/i) {
		quest::say("The clockworks are the responsibility of Manik Compolten. Speak with him - I am sure he is here somewhere.");
	}
	elsif ($text=~/cargo clockwork/i) {
		quest::say("The cargo clockwork is located near the entrance to Ak'Anon in the Steamfont Mountains. It runs a delivery to the windmills every five days at eight in the morning. There have been attacks by a group of highwaymen. They are quite a formidable group. I have offered a reward for their heads. Be very careful if you plan on escorting the cargo clockwork. This trio of bandits is very strong.");
	}
}

sub EVENT_ITEM {
	#:: Match a 85056 - Hector's Severed Head, 85055 - Renaldo's Severed Head, and a 85057 - Jerald's Severed Head
	if (plugin::takeItems(85056 => 1, 85055 => 1, 85057 => 1)) {
		quest::say("I heard our shipment made it back safely. These heads will send a message to any other thief that plans on robbing our cargo shipments. Thank you $name, take this mask and this coin as your reward.");
		#:: Give a 85058 - Highway Protectors Mask
		quest::summonitem(85058);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(255, 2); 		#:: + Gem Choppers
		quest::faction(288, 1); 		#:: + Merchants of Ak'Anon
		quest::faction(333, 1); 		#:: + King Ak'Anon
		quest::faction(238, -1); 		#:: - Dark Reflection
		quest::faction(1604, -1); 		#:: - Clan Grikbar
		#:: Grant a moderate amount of experience
		quest::exp(6000);
		#:: Create a hash for storing cash - 300 to 350cp
		my %cash = plugin::RandomCash(300,350);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
