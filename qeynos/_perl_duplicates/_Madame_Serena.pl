sub EVENT_SAY {
	if ($text=~/follow/i) {
		if ($text=~/bertoxxulous/i) {
			quest::say("The catacombs contain safe haven for you and I. It is our place to you I tell no lie.");
		}
		elsif ($text=~/brell/i) {
			quest::say("The place of true power is usually beneath your feet. Stay in this city and a rare enemy you just may meet.");
		}
		elsif ($text=~/bristlebane/i) {
			quest::say("To be like the king of thieves is the path in which you sway. Go to Crow's after sundown. It is better than in day.");
		}
		elsif ($text=~/cazic thule/i) {
			quest::say("You will find that a slight friend is elvish and dark. Be forewarned that in this city it is best not to bark.");
		}
		elsif ($text=~/erollisi/i) {
			quest::say("To be strong in the way of love is truly the only way. Go into Karana's Paw and enjoy your day.");
		}
		elsif ($text=~/innoruuk/i) {
			quest::say("To hate is your way. Just as the father of the dark race. Go forth to Nekutulos is where you should go at good pace.");
		}
		elsif ($text=~/karana/i) {
			quest::say("You will be safe in this city of thunder. Travel to the catacombs for easy plunder.");
		}
		elsif ($text=~/mithaniel/i) {
			quest::say("As is your god you are one of true valor which you cannot part. Go forth into the catacombs and say hail Mister Bloodheart.");
		}
		elsif ($text=~/prexus/i) {
			quest::say("He created the Kedge freaks which are now gone from this land. Go deep into the caves of Jaggedpine and someone will take your hand.");
		}
		elsif ($text=~/quellious/i) {
			quest::say("The tranquility and peace of the child lies within your heart. By fighting the opal elves, you shall be doing your part.");
		}
		elsif ($text=~/rallos zek/i) {
			quest::say("To die in battle is the true and only way. Go into Blackburrow and join the fray.");
		}
		elsif ($text=~/rodcet nife/i) {
			quest::say("The power of healing is brought forth in your mass. Go past the gates and tell Zutros you are from Highpass.");
		}
		elsif ($text=~/solusek/i) {
			quest::say("To step foot upon his land would set your body ablaze. Go far north of Freeport to find the eye in the day.");
		}
		elsif ($text=~/tribunal/i) {
			quest::say("You wish to bring the land of justice for all crimes which are unpaid. Start your mission in Freeport, where crime is unafraid.");
		}
		elsif ($text=~/tunare/i) {
			quest::say("From mother of all elves you comfort and peace. Walk into the crops of Karana and all troubles will cease.");
		}
		elsif ($text=~/veeshan/i) {
			quest::say("The mother of all wyrms has her blood running deep withingreat cities. Be aware that you are not alone in this town of no pity.");
		}
	}
}

sub EVENT_ITEM {
	#:: Match 50 gold
	if (plugin::takeCoin(0, 0, 50, 0)) {
		#:: Match if faction is Amiable or better
		if ($faction < 5) {
			quest::say("Fifty gold? You must want a rune of fortune. If you want another one, give fifty gold to Mizr N'Mar in the Neriak library.");
			#:: Give a 10531 - Rune of Fortune
			quest::summonitem(10531);
			#:: Ding!
			quest::ding();
			#:: Grant a small amount of experience
			quest::exp(100);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
