sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("May Karana guide your strengths.  Are you a [citizen of Qeynos] or a visitor?");
	}
	elsif ($text=~/citizen of qeynos/i) {
		quest::say("Then I would urge you to attend daily services in the Temple of Thunder.  You are a [member of Thunder] are you not?  Or maybe I am mistaken and you are just [lost].");
	}
	elsif ($text=~/visitor/i) {
		quest::say("Then study and spread the words of Karana the Rainkeeper. May all the storms in your heart be controlled by the Rainkeeper. You are young to the world just as [Cheslin] is."); 
	}
	elsif ($text=~/member of thunder/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I welcome you. Karana cares for all of His flock. He bestows a touch of His power upon the souls of the Clerics and Paladins of our temple. We look after His flock. Speaking of which, I require the assistance of a young paladin to [deliver provisions to needy members].");
		}
		else {
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		}
	}
	elsif ($text=~/lost/i) {
		quest::say("Then study and spread the words of Karana the Rainkeeper.  May all the storms in your heart be controlled by the Rainkeeper.  You are young to the world just as [Cheslin] is.");
	}
	elsif ($text=~/cheslin/i) {
		quest::say("My son, Cheslin, is currently in training to be a Qeynos Guard.  I fear it was not his calling.  He is not quite in our realm of reality.  He spent too many years of playing games of warriors and dragons.  He will be doing his first patrols in Qeynos Hills this week.  If you are near there, I would appreciate it if you would watch and see him safely through his first patrols.  Tell him I sent you.");
	}
	elsif ($text=~/deliver provisions/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Good show!! Here you are, young knight. Take these blankets to any resident who desires warmth. Ask them if they are followers of Karana, then ask if they require temple blankets. Be careful, the plains are quite dangerous for a young knight.");
			#:: Give a 12102 - Temple Blankets
			quest::summonitem(12102);
		}
		else {
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		}
	}
	elsif ($text=~/karana bandits/i) {
		quest::say("In the Plains of Karana can be found the [Karana bandits]. They plague our followers and dare to use the name of the Rainkeeper as a title. For this, Karana commands their deaths. I have a bounty for every returned bandit sash, collectible by members only. For clerics, Gehna has a bounty on binder spectacles.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12100 - Bandit Sash
	if (plugin::takeItems(12100 => 1)) {
		quest::say("Good work knight. The [Karana bandits] have been plaguing the Rainkeepers flock for some time.  Take this as a small reward for your devotion.  Continue the fight against the Karana Bandits.  Ahh... I wish [Cheslin] was equally as skilled.");
		#:: Give a random reward: 6019 - Bronze Mace, 6021 - Bronze Two Handed Hammer, 6022 - Bronze Warhammer, 6023 - Bronze Flail, 6024 - Bronze Morning Star, 6025 - Bronze Warclub, 9002 - Round Shield
		quest::summonitem(quest::ChooseRandom(6019, 6021, 6022, 6023, 6024, 6025, 9002));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, 20);		#:: + Knights of Thunder
		quest::faction(221, -20);		#:: - Bloodsabers
		quest::faction(341, 15);		#:: + Priests of Life
		quest::faction(262, 15);		#:: + Guards of Qeynos
		#:: Grant a large amount of experience
		quest::exp(6200);
		#:: Create a hash for storing cash - 800 to 1200 cp
		my %cash = plugin::RandomCash(800,1200);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match a 18839 - Sealed Letter
	elsif (plugin::takeItems(18839 => 1)) {
		quest::say("Hmmph!! My son is living in a fantasy world. Still, you have done well. Take this as a token of appreciation. It is not much, but it may come in handy.");
		#:: Give a random reward:  17005 - Backpack, 6041 - Cast-Iron Warhammer, 2139 - Raw-hide Gorget, 2150 - Small Raw-hide Mask, 9001 - Buckler
		quest::summonitem(quest::ChooseRandom(17005, 6041, 2139, 2150, 9001));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(280, 10);		#:: + Knights of Thunder
		quest::faction(221, -10);		#:: - Bloodsabers
		quest::faction(341, 7);			#:: + Priests of Life
		quest::faction(262, 7);			#:: + Guards of Qeynos
		#:: Grant a moderate amount of experience
		quest::exp(1500);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
