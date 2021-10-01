sub EVENT_SAY {
	if($text=~/Hail/i) {
 quest::say("Greetings, $name. Careful, I have seen many orcs and goblins roaming around. The roads are not as safe as they used to be. I can provide protection if need be.");
		} else {
			quest::say("You did not win the race, go away.");
	}
	if($text =~ /protection/) {
 quest::say("Ok! On your feet, lets move! Just tell me to leave when you no longer need me.");
		$npc->SetFollowID($client->GetID());
	}
	if($text =~ /leave/) {
		quest::say("Very well, good luck $name!");
		$npc->SetFollowID(0);
	}
	if($text =~ /sit/) {
	quest::say("Taking a rest!");
		$npc->SetAppearance(1, 0);
	}
	if($text =~ /stand/) {
	quest::say("I have had enough rest, time to get going $name!");
		$npc->SetAppearance(0, 0);
	}
	if($text=~/look/i) {
		$x = $npc->GetX();
		$y = $npc->GetY();
		quest::set_locality($x - 20, $x + 20, $y - 20, $y + 20);
	quest::say("What? What is it???");
	}
}
sub EVENT_COMBAT {
    if($combat_state == 1) {
    quest::say("For the glory of Kaladim!!");
    quest::say("You are no more");
 }
}
#END of FILE Zone:butcher  ID:68064 -- Glorin_Binfurr 

