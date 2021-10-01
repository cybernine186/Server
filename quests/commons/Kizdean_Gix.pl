#:: Create a scalar variable to store a response state
my $ResponseVersion;

sub EVENT_SPAWN {
	$ResponseVersion = quest::ChooseRandom(1, 2);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("If you have business then out with it!! If not, then please be gone. I have little time to waste on chitchat!");
	}
	elsif ($text=~/utalk adarev otcin/i) {
		#:: Match if faction is Amiable or better
		if ($faction <= 4) {
			quest::say("You speak the words of the Dead. You must be the assistance Loveal was to send. You must work quickly! Inside Befallen are the three pieces to the [Thex Mallet] which are to be returned to Loveal. Find Hubard L'rodd. He was my assistant. Give him this note and he should have information.");
			#:: Summon a 18891 - Tattered Cloth Note
			quest::summonitem(18891);
		}
		else {
			quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
		}
	}
	elsif ($text=~/the dead/i) {
		quest::say("The Dead are the combined might of the [Teir'Dal] shadowknights and necromancers. A mightier force cannot be found in all of Norrath.");
	}
	elsif ($text=~/teir'dal/i) {
		#:: Does not respond on live
	}
	elsif ($text=~/thex mallet/i) {
		if ($ResponseVersion == 2) { 
			#:: Match if faction is Amiable or better
			if ($faction <= 4) {
				quest::say("The Thex Mallet is a very special weapon of elven creation. It is as ancient as Norrath itself. Queen Cristanos commands that we find it and return it to Loveal S'nez. That is all you need to know.");
			}
			else {
				quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
			}
		}
	}
	elsif ($text=~/messages for neriak/i) {
		if ($ResponseVersion == 1) { 
			#:: Match if faction is Amiable or better
			if ($faction <= 4) {
				quest::say("It's about time a courier reached these wastelands of humanity. I have urgent news for the Dead. Take this message at once. Let no one stop you. Be on the lookout for the Feir'Dal [Silent Watch]! They have learned of our quest.");
				#:: Give a 18889 - Sealed Letter
				quest::summonitem(18889);
			}
			else {
				quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
			}
		}
		else {
			#:: Match if faction is Amiable or better
			if ($faction <= 4) {
				quest::say("Inform the Dead that I have no further information at this time. I shall continue with my work as directed. Please return regularly, for I am expecting to break new ground.");
			}
			else {
				quest::say("How dare you enter my presence?!  In the name of the Dead I should strike you down!");
			}
		}
	}
	elsif ($text=~/silent watch/i) {
		if ($ResponseVersion == 1) { 
			quest::say("The Koada'Dal have created an elite band of paladins, greater even than our own Teir'Dal Dragoons. They exist on the edge of righteousness. They will perform despicable acts in the name of their deity, barely skimming the edge of evil.");
		}
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
