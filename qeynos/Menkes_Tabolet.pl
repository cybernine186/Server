sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, fine citizen of Qeynos, what can I make for you today?  How about a genuine, handmade [rat fur cap]?  Or maybe a lovely [rat pelt cape]?  Maybe you'd like a necklace?  For a small fee. I can make a nice [snake fang necklace] or a [lucky rat's foot necklace].");
	}
	elsif ($text=~/rat fur cap/i) {
		quest::say("Rat fur cap?  You're in luck, that happens to be my specialty, $name.  Just bring me 2 pieces of rat fur and 3 gold, and I'll make one up for you while you wait.");
	}
	elsif ($text=~/rat pelt cape/i) {
		quest::say("The rat pelt cape..  that happens to be my specialty!  I must say, it would be the perfect choice to go with that outfit you have on.  All I need are 3 rat pelts, those big ol' rats out in the hills work great for these capes, and 4 gold.  I must say, at these prices, everyone in Qeynos will be wearing one in a matter of weeks.");
	}
	elsif ($text=~/snake fang necklace/i) {
		quest::say("Hey, great choice..  the snake fang necklace just happens to be my specialty, $name!  Just bring me 3 snake fangs, and 2 gold.  With one of these around your neck, you're sure to be the center of attention down at Crow's..  or anywhere else you fill your mug.");
	}
	elsif ($text=~/lucky rat/i) {
		quest::say("Now that is exactly what you need my friend, a lucky rat's foot necklace..  and, it just happens to be my specialty!  Just bring me one rat's foot, some rat whiskers, and I won't even charge you any gold. Just buy me a honey mead, and you'll be the luckiest rat dodger this side of Highpass.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 6
	if ($wp == 6) {
		quest::say("Get your rat fur caps here! Get your snakes fang necklaces here! Special discount prices.. this week only.");
	}
	#:: Match waypoint 9
	elsif ($wp == 9) {
		quest::say("Custom made rat pelt capes.. cheap, cheap, cheap!");
	}
	#:: Match waypoint 12
	elsif ($wp == 12) {
		quest::say("Feeling a bit unlucky lately? Gnoll pups always picking on you? Fire beetles attacking you whenyou aren't looking? what you need is a lucky rat's foot necklace! Satisfaction guaranteed!");
	}
	#:: Match waypoint 17
	elsif ($wp == 17) {
		quest::say("Get your rat fur caps here! Get your snake fang necklaces here! Special discount prices.. This week only.");		
	}
	#:: Match waypoint 23
	elsif ($wp == 23) {
		quest::say("Feeling a bit unlucky lately? Gnoll pups always picking on you? Fire beetles attacking you when you aren't looking? what you need is a lucky rat's foot necklace! Satisfaction guaranteed!");		
	}
	#:: Match waypoint 27
	elsif ($wp == 27) {
		quest::say("Menkes' discount fashions and jewelry, now open for business.. custom made hats, to fit any size head.");
	}
}

sub EVENT_ITEM {
	#:: Match two 13064 - Piece of Rat Fur and 3 gold
	if (plugin::takeItemsCoin(0,0,3,0, 13064 => 2)) {
		quest::say("Hey, look at this, some of my best work, if I do say so myself. Enjoy, and tell your friends");
		#:: Give a 1050 - Rat Fur Cap
		quest::summonitem(1050);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(121, 2);		#:: + Qeynos Citizens
		#:: Grant a small amount of experience
		quest::exp(200);
	}
	#:: Match three 13054 - Giant Rat Pelt and 4 gold
	elsif (plugin::takeItemsCoin(0,0,4,0, 13054 => 3)) {
		quest::say("Hey, look at this, some of my best work, if I do say so myself. Enjoy, and tell your friends");
		#:: Give a 1051 - Rat Pelt Cape
		quest::summonitem(1051);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(121, 2);		#:: + Qeynos Citizens
		#:: Grant a small amount of experience
		quest::exp(200);
	}
	#:: Match three 13067 - Snake Fang and 2 gold
	elsif (plugin::takeItemsCoin(0,0,2,0, 13067 => 3)) {
		quest::say("Hey, look at this, some of my best work, if I do say so myself. Enjoy, and tell your friends");
		#:: Give a 1052 - Snake Fang Necklace
		quest::summonitem(1052);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(121, 2);		#:: + Qeynos Citizens
		#:: Grant a small amount of experience
		quest::exp(200);
	}
	#:: Match one 13065 - Rat Foot, two 13071 - Rat Whiskers, and 2 gold
	elsif (plugin::takeItemsCoin(0,0,2,0, 13065 => 1, 13071 => 2)) {
		quest::say("Hey, look at this, some of my best work, if I do say so myself. Enjoy, and tell your friends");
		#:: Give a 1053 - Rat's Foot Necklace
		quest::summonitem(1053);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(121, 2);		#:: + Qeynos Citizens
		#:: Grant a small amount of experience
		quest::exp(200);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
