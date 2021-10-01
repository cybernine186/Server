sub EVENT_SPAWN {
	#:: Create a timer 'depop' that triggers every 180 seconds (3 min)
	quest::settimer("depop",180);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I... am... the... Master... of... Elements.. Elements... Forgive... me. I am... unaccustomed.. to.. speaking.. this.. mortal... tongue. Might.. you... be... the... One?");
	}
	elsif ($text=~/i am the one/i) {
		quest::say("Trilith... Magi'kot.. knelt.. before.. the.. orb.. in.. his.. his.. last.. few.. moments... of.. mortal.. life. He... too... believed.. that.. he.. had.. the.. power.. and.. balance.. needed.. to.. grasp... control.. of.. the.. elements. He.. was.... flawed. Coming.. to... me... is.. a.. matter.. of.. no.. small.. import. Only.. only... one.. who.. is.. of.. balance.. and.. power... power.. may.. control.. the.. Orb.. of... Mastery. Give.... give.. me.. the.. Elements.. you.. have... gathered.. and.. I.. shall.. see.. if.. you.. are.. ready.. ready.. to control.. the... Elements.. of... life.. life.. life.");
	}
}

sub EVENT_ITEM {
	#:: Match a 28032 - Element of Earth, a 28009 - Element of Fire, a 28006 - Element of Water, and a 28033 - Element of Wind
	if (plugin::takeItems(28032 => 1, 28009 => 1, 28006 => 1, 28033 => 1)) {
		quest::say("You... are.. balanced... and.. powerful.. for.. a.. mortal... $name ..... $name. More.. so.. than.... Magi'kot. But.... you.. are.. not.. yet.. ready.. to.. transcend.. transcend... this.. mortal.. coil. Take.. take.. seize.. this.. Orb... for.. you.. are.. worthy.. of.. reward.. and.. with... the.. aid.. of... the... balance.. balance.. contained.. within.. the.. Orb.. you.. may.. yet.. reach.. the... ultimate... Mastery.");
		#:: Give a 19436 - Spell: Summon Orb
		quest::summonitem(19436);
		#:: Step the timer 'depop'
		quest::stoptimer("depop");
		#:: Depop without spawn timer
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_TIMER {
	#:: Match the timer 'depop'
	if ($timer eq "depop") {
		#:: Step the timer 'depop'
		quest::stoptimer("depop");
		#:: Depop without spawn timer
		quest::depop();
	}
}
