sub EVENT_SPAWN {
	quest::gmsay("[$zoneln] Innoruuk has been awakened" . "!", 13, 1, 0, 0); 
}

sub EVENT_SLAY {
	quest::shout("I feel your rage as your body fights for life. You feed me well! My children, your father protects you, praise to him!");
}

sub EVENT_DEATH {
	quest::gmsay("[$zoneln] Innoruuk has been slain by " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . ".", 13, 1, 0, 0); 
}


sub EVENT_DEATH_COMPLETE {
	quest::shout("This is no victory, mortals! We shall meet again, and I WILL exact my revenge.");
}
