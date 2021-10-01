sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say("Hello $name. Have you ever peered beyond our little world? Somewhere out there in the vast darkness is a world filled with great technology and adventure. Our people should concentrate on reaching these distant worlds beyond the sparkling skies.");
	}
	if ($text=~/Larkon sent me/i) {
		if ($faction <= 4) {
			quest::say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you. Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica. But I suppose if Larkon sent you that you truly wish to prove yourself, eh? You'll have to get your hands a bit dirty, though. Take this box and fill it with livers from those infected rats. We need them for research. Well go on. You can take a bath when you're done.");
		} else {
			quest::say("So they found another young member to attend to their putrid hunt, eh? Take this box. You will notice that your box has ten slots and does not smell very good. That is because each slot must be filled with the diseased livers of infected rats. Hop to it, then! Go get some diseased livers. And if you should get bitten and find yourself diseased or poisoned, be sure to visit the Abbey of Deep Musing. They have healers who can cure disease. Do not forget to return the box to Larkon.");
		}
		#:: Give a 17923 - Air Tight Box
		quest::summonitem(17923);
	}
	if ($text=~/lens/i) {
		quest::say("Spare Telescopic Lens?? I am sorry but I don't have any spares right now.. Oh wait!! I do. Here you are my friend. Careful with that. They are very rare.");
		#:: Give a 13277 - Telescope Lens
		quest::summonitem(13277);
	}
}

