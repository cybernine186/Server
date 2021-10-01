sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome to the Spires of Innoruuk. May your destiny be paved with the Words of Innoruuk. What is it you seek?  [Healing]? [Curing of disease]? [Curing of poison]?  That is my divine duty. So commands Master Zexus.");
	}
	elsif ($text=~/healing/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			#:: Very odd response.
			quest::say("That is why we are here. Look for Master Ulazia W'Selo. He can be found among the hallways of the Spires of Innoruuk.");
		}
		#:: Missing Indifferent response
		else {
			quest::say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");
		}
	}
	elsif ($text=~/disease/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Whatever the malady, I can surely rid you of it. First, you must donate 6 gold coins. The power of life is not easily acquired when you follow the unholy might of Innoruuk.");
		}
		#:: Missing Indifferent response
		else {
			quest::say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");
		}
	}
	elsif ($text=~/poison/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("So a toxic substance races to your heart? It is best we stop that at once! Ah... But, before I go on, you must pay the required donation of 8 gold coins.");
		}
		#:: Missing Indifferent response
		else {
			quest::say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");
		}
	}
	elsif ($text=~/innoruuk/i) {
		quest::say("You speak the name of the prince of Hate. He is the higher power who set the Teir’Dal upon this land. All Teir’Dal pay homage to him. If they do not, they are surely [Heretics].  And, if they are heretics, they surely must die!!");
	}
	elsif ($text=~/heretics/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("Speak not of Teir’Dal Heretics. Those Teir’Dal who do not follow Innoruuk shall be cut down! Master Kerton R’dev of the Spires of Innoruuk is seeing to that.");
		}
		#:: Missing Indifferent response
		else {
			quest::say("No sane member of the Priests of Innoruuk would tolerate your presence. Begone or more than words shall I lay upon thee.");
		}
	}
	elsif ($text=~/teir'dal/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("I see the ancient language of the elf kind has been neglected. We dark elves are the Teir’Dal, superior to all elves. The high elves are known as the Koada’Dal and the wood elves are the Fier’Dal. There was once another, but that race is now extinct.");
		}
		#:: Missing Indifferent response
		else {
			quest::say("No sane member of the Priests of Innoruuk would tolerate your presence.  Begone or more than words shall I lay upon thee.");
		}
	}
}

sub EVENT_ITEM {
	#:: Match 6 gold pieces
	if (plugin::takeCoin(0, 0, 6, 0)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("May the breath of life pass through your failing body and cast its foes from you. Unngh... Praise Innoruuk!");
			#:: Cast spell 213 - Cure Disease
			$npc->CastSpell(213,$client);
		}
		#:: Missing Indifferent response
		else {
			quest::say("No sane member of the Priests of Innoruuk would tolerate your presence.  Begone or more than words shall I lay upon thee.");
			#:: Return coin
			quest::givecash($copper, $silver, $gold, $platinum);
		}
	}
	#:: Match 8 gold pieces
	elsif (plugin::takeCoin(0, 0, 8, 0)) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("May the breath of life pass through your failing body and cast its foes from you. Unngh... Praise Innoruuk!");
			#:: Cast spell 203 - Cure Poison
			$npc->CastSpell(203,$client);
		}
		#:: Missing Indifferent response
		else {
			quest::say("No sane member of the Priests of Innoruuk would tolerate your presence.  Begone or more than words shall I lay upon thee.");
			#:: Return coin
			quest::givecash($copper, $silver, $gold, $platinum);
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
