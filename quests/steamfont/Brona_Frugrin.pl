sub EVENT_SAY { 
	if ($text=~/Hail/i) {
		quest::say("Well met, $name!  What brings you out this way?  Are you interested in becoming an observer?  No, you look like the adventuring type.  The wilds of the Steamfont Mountains is as far as my body goes.  But through my [duties] as an observer, my mind travels the cosmos.");
	}
	if ($text=~/duties/i) {
		quest::say("Well, I am quite an accomplished enchanter but most of my time now is spent crafting the magical lenses that enable us to see beyond the ceiling of Norrath and into other realms and dimensions.  Say, in your travels have you encountered any [evil eyes]?");
	}
	if ($text=~/evil eyes/i) {
		quest::say("Evil eyes are dangerous creatures of great magical power.  There is a rumor that somewhere on Antonica there lives a powerful evil eye by the name of Borxx. I believe that with the lens from her eye and some expert tinkering, I could create a device that will enable me to observe the gods themselves in their native planes. If you were to bring me this lens, the Eldritch Collective would reward you greatly.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10170 - Evil Eye Lens
	if (plugin::check_handin(\%itemcount, 10170 => 1)) {
		quest::say("This lens is perfect, $name!  Please, take this staff in return for your services.");  # Couldn't find real text, so I made this up.
		#:: Give a 10171 - Staff of the Observers
		quest::summonitem(10171);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Set factions
		quest::faction(333, 15);	# + King Ak'Anon
		quest::faction(245, 15);		# + Eldrich COllective
	}
	#:: Return unused items
	plugin::return_items(\%itemcount);
}
