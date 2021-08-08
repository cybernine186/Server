#:: Create a scalar variable to store an item count
my $ItemCount;

sub EVENT_SPAWN {
	#:: Reset item count on spawn
	$ItemCount = 0;
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, friend, and welcome to the Mermaid's Lure. Here, we sell fishing supplies and some imported goods from far-off lands. And, if you've got a few minutes, I could even tell you a [story] or two.");
	}
	elsif ($text=~/story/i) {
		quest::say("Stories? Stories? I saw more adventure before I was ten years tall than you'll see in your whole miserable existence. I've been everywhere, [Odus], [Faydwer], [Kunark]. . . You name it, and I can tell ya a little something 'bout it. . . If you buy me a sip of brandy, of course!");
	}
	elsif ($text=~/odus/i) {
		if ($ItemCount == 0) {
			#:: Made up
			quest::say("I'll tell you about [Odus] if you give me that sip of brandy.");
		}
		else {
			quest::say("You haven't lived until you've seen Odus. Erud was the first human to cross the sea, and he founded the great city of Erudin. The trade routes from here to Odus are busy and prosperous, but can also be very dangerous.");
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	elsif ($text=~/faydwer/i) {
		if ($ItemCount == 0) {
			#:: Made up
			quest::say("I'll tell you about [Faydwer] if you give me that sip of brandy.");
		}
		else {
			quest::say("I call Faydwer the home of the little people. They say the continent was named by the high elves when they landed on its shores long ago. I've even heard tales of an ancient elven vampire who lives there. . . Just another Felwithe legend, I'll bet!");
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	elsif ($text=~/kunark/i) {
		if ($ItemCount == 0) {
			#:: Made up
			quest::say("I'll tell you about [Kunark] if you give me that sip of brandy.");
		}
		else {
			quest::say("Even I can't tell you much about that continent. Kunark is a tough place, populated by even tougher creatures. I hear the high elves of Faydwer have been trying for years to establish a small port on Kunark's hostile shores.");
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	elsif ($text=~/tax collection/i) {
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Match if the key exists
		if (quest::get_data($key)) {
			quest::say("Argh! You curvy sea goblin! Taxes, you say?! Peh! I got your taxes right here! I sure don't get the services those taxes are supposed to provide! You can tell them ol' Captain Rohand said so!");
			#:: Give a 13177 - Rohand's Tax Payment
			quest::summonitem(13177);
			#:: Set faction
			quest::faction(291, -1);	#:: - Merchants of Qeynos
		}
	}
}

sub EVENT_ITEM {
	#:: Match a 13034 - Brandy
	if (plugin::takeItems(13034 => 1)) {
		quest::say("Yeah, this is just what I've been craving!");
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(291, 25);		#:: + Merchants of Qeynos
		quest::faction(223, -5);		#:: - Circle Of Unseen Hands
		quest::faction(219, 3);			#:: + Antonius Bayle
		quest::faction(229, 2);			#:: + Coalition of Tradefolk
		quest::faction(262, 5);			#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(150);
		#:: Set item count to 1
		$ItemCount = 1;
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
