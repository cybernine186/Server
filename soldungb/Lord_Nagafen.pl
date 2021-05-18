sub EVENT_SPAWN {
	#:: Create a proximity 400 units across, without proximity say
	quest::set_proximity($x - 200, $x + 200, $y - 200, $y + 200, $z - 200, $z + 200, 0);
	quest::gmsay("[$zoneln] Lord Nagafen has been awakened" . "!", 13, 1, 0, 0); 
}

sub EVENT_ENTER {
	if (($ulevel >= 53) && ($status < 80)) {
		quest::echo(0, "I will not fight you, but I will banish you!");
		#:: Move player to Lavastorm (27) at the specified coordinates, facing North
		$client->MovePC(27, -64, 262, -93.96, 0);
	}
}

sub EVENT_DEATH_COMPLETE {
	#quest::gmsay("[$zoneln] Lord Nagafen has been slain by " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . ".", 13, 1, 0, 0);

	if ($entity_list->GetMobByID($killer_id)->IsClient()) {
		$characteridbymob = $entity_list->GetClientByID($killer_id)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);
		
		quest::gmsay("[$zoneln] Congratulations to <$guildname>'s member, " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . " for being the first to slay Lord Nagafen!", 13, 1, 0, 0);
		return;
	}

	if ($entity_list->GetMobByID($killer_id)->IsPet()) {
		$petowner = $entity_list->GetMobByID($killer_id)->GetOwnerID();
		$characteridbymob = $entity_list->GetClientByID($petowner)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);

		quest::gmsay("[$zoneln] Lord Nagafen has been slain by " . ($entity_list->GetMobByID($petowner) ? $entity_list->GetMobByID($petowner)->GetCleanName() : "an unknown hand") . " of <$guildname>", 13, 1, 0, 0);
		return; 
	}
}
