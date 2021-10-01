sub EVENT_SPAWN {
	#:: Get current location
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	#:: Create a proximity, 100 units across, 100 units tall, and enable proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 1);
	#:: Also enable proximity say
	quest::enable_proximity_say();
	#:: Create a timer that loops every 90 seconds
	quest::settimer("shoot", 90);
}

sub EVENT_ENTER {
	#:: Check for 18709 - Tattered Note
	if (plugin::check_hasitem($client, 18709)) {
		$client->Message(15,"As you orient yourself amongst the peacefulness of the Surefall Glade, Hager Sureshot addresses you stemly, 'You're not here to poach are you? Of course you're not. Excuse my manners. I can see that you are a young ranger in training. Read the note in your inventory and hand it to me to begin your training.'");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.  Feel free to rest here in Surefall Glade.  Just be sure you do no hunting whilst here.  If so, then you shall pay the punishment of death.  I trust you will [abide by the laws]?");
	}
	elsif ($text=~/abide by the laws/i) {
		quest::say("That is wise.  Your health, for now, is assured.  A plague of hunters has infested our land heavily in recent weeks.  The word is out that [Mammoth] still lives.  Hunters have flocked here in search of a trophy or profit and glory.  Instead, they find the deadly accuracy of my arrows.");
	}
	elsif ($text=~/mammoth/i) {
		quest::say("Mammoth is the great bear of the caves.  [Tunare] has blessed our home with Mammoth's presence.  It is said that when the great bear dies, so too shall the Jaggedpine.  He would be quite a trophy to some hunter.  And quite profitable to a poacher. Even the infamous [Talym Shoontar] has tried his hand at the hunt.");
	}
	elsif ($text=~/tunare/i) {
		quest::say("Tunare is the Mother of All.  It is through Her will that we protect this land and its many creatures.");
	}
	elsif ($text=~/talym shoontar/i) {
		quest::say("Talym Shoontar is a poacher.  He has eluded us for quite some time.  He has organized parties of poachers to plague our forest as well as others.  He hails from Halas, but I have heard he now calls the Plains of Karana home.  I have placed a bounty upon his head.  Do you [wish to collect the bounty]?");
	}
	elsif ($text=~/wish to collect the bounty/i) {
		quest::say("That's the spirit!!  Spoken like a true Protector of the Pine!  Last I heard, Talym Shoontar was hunting in the Plains of Karana.  He has also been spotted running to and from Qeynos.  No doubt he is selling hides to some merchant.  End his life of hunting.  Bring me his head to collect the bounty.");
	}
}

sub EVENT_ITEM {
	#:: Match a 18709 - Tattered Note
	if (plugin::takeItems(18709 => 1)) {
		quest::say("Welcome, we are the Protectors of the Pine. Wear this tunic of our guild, and help us defend our great and beautiful woods. Go to Larsk Juton, he will help train you and teach you the power of the woods.");
		#:: Give a 13509 - Mud Stained Tunic*
		quest::summonitem(13509);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(302, 100);	#:: + Protectors of Pine
		quest::faction(272, 25);	#:: + Jaggedpine Treefolk
		quest::faction(306, -15);	#:: - Sabertooths of Blackburrow
		quest::faction(262, 25);	#:: + Guards of Qeynos
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Match a 13913 - Barbarian Head
	elsif (plugin::takeItems(13913 => 1)) {
		quest::say("His days of hunting are over. In the name of the Protectors of the Pine, I offer you this reward. If you are unable to make use of it, you may sell it. I suggest you hold onto it. If you are a ranger it will come in handy.");
		#:: Give a 17804 - Tailored Quiver
		quest::summonitem(17804);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(302, 10);	#:: + Protectors of Pine
		quest::faction(272, 10);	#:: + Jaggedpine Treefolk
		quest::faction(306, -30);	#:: - Sabertooths of Blackburrow
		quest::faction(262, 10);	#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(1000);
		#:: Create a hash for storing cash - 1100 to 1200cp
		my %cash = plugin::RandomCash(1100,1200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_TIMER {
	#:: Match timer Shoot
	if ($timer eq "shoot") {
		quest::doanim(9);
	}
}
