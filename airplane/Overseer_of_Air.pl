sub EVENT_SPAWN {
	quest::gmsay("[$zoneln] Overseer of Air has been awakened" . "!", 13, 1, 0, 0); 
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("So you have awakened me!! It seems my brother was not much of a challenge. Before we get on to business, there are some matters that must be addressed. But enough talk, let's address these matters first.");
	}
	elsif ($text=~/matters/i) {
		quest::say("The matter at hand is where you are to go after this. I believe that crazy halfling will be showing up. But if by chance he oversleeps, there is some information you should have.");
	}
	elsif ($text=~/information/i) {
		quest::say("You have come to my home. This is also home to the soul carriers and essence harvesters. On the mortal plane, they are still natural enemies, but have learned to live together and are now peaceful creatures here in the Plane of Sky. Be forewarned that as you proceed about your tour, each gate you must reach and pass through will become substantially harder.");
	}
}

sub EVENT_DEATH {
	#:: Spawn The Plane of Sky >> the_Hand_of_Veeshan (71060), without grid or guild war, at the specified location
	quest::spawn2(71060, 0, 0, -1462.2, -270.1, 1250.9, 62.9);
	quest::gmsay("[$zoneln] Overseer of Air has been slain by " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . ".", 13, 1, 0, 0);
}
