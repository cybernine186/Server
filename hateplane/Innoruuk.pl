sub EVENT_SLAY {
	quest::shout("I feel your rage as your body fights for life. You feed me well! My children, your father protects you, praise to him!");
}


sub EVENT_DEATH_COMPLETE {
	quest::shout("This is no victory, mortals! We shall meet again, and I WILL exact my revenge.");
	if ($entity_list->GetMobByID($killer_id)->IsClient()) {
		$characteridbymob = $entity_list->GetClientByID($killer_id)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);
		
		quest::gmsay("[$zoneln] Congratulations to <$guildname>'s member, " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . " for being the first to slay Innoruuk!", 13, 1, 0, 0);
		return;
	}

	if ($entity_list->GetMobByID($killer_id)->IsPet()) {
		$petowner = $entity_list->GetMobByID($killer_id)->GetOwnerID();
		$characteridbymob = $entity_list->GetClientByID($petowner)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);

		quest::gmsay("[$zoneln] Congratulations to <$guildname>'s member, " . ($entity_list->GetMobByID($petowner) ? $entity_list->GetMobByID($petowner)->GetCleanName() : "an unknown hand") . " for being the first to slay Innoruuk!", 13, 1, 0, 0);
		return; 
	}
}
