
sub EVENT_DEATH_COMPLETE  {
	$guildslain = quest::getguildnamebyid($uguild_id);

	
	if ($killer_id == 0 && length($killer_name) > 0) {
		$connect = plugin::LoadMysql();
		$query = "SELECT id FROM character_data WHERE name = ? LIMIT 1;";
		$query_handle = $connect->prepare($query);
		$query_handle->execute($killer_name);
		$charid = 0;
		while (@row = $query_handle->fetchrow_array()) {
			$charid = $row[0];
		}
		if ($charid == 0) {
			# TODO: Add error handling/reporting/blah
			return;
		}

		$guildid = quest::getguildidbycharid($charid);
		$guildname = quest::getguildnamebyid($guildid);
		
		quest::we(315,"[PVP] $name of <$guildslain> has been killed by $killer_name of <$guildname> in $zoneln!"); 
		#Lets use world emote instead of GM say to see if it picks up on Discord EQ bot
		return;
		
	}
	
	if ($entity_list->GetMobByID($killer_id) && $entity_list->GetMobByID($killer_id)->IsClient()) {
		$characteridbymob = $entity_list->GetClientByID($killer_id)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);
		$killerdeitycheck = $entity_list->GetMobByID($killer_id)->GetDeity();
		$killeddeitycheck = $client->GetDeity();
		
		quest::gmsay("[PVP] $name <$guildslain> of the has been killed by " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . " <$guildname> of the in $zoneln!", 315, 1, 0, 0);
		return;
	}
	
	if ($entity_list->GetMobByID($killer_id) && $entity_list->GetMobByID($killer_id)->IsPet()) {
		$petowner = $entity_list->GetMobByID($killer_id)->GetOwnerID();
		$characteridbymob = $entity_list->GetClientByID($petowner)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);
		$killerdeitycheck = $entity_list->GetMobByID($petowner)->GetDeity();
		$killeddeitycheck = $client->GetDeity();

		quest::gmsay("[PVP] $name <$guildslain> of the has been killed by " . ($entity_list->GetMobByID($petowner) ? $entity_list->GetMobByID($petowner)->GetCleanName() : "an unknown hand") . " <$guildname> of the in $zoneln!", 315, 1, 0, 0);
		return; 
		
	}
}

sub EVENT_DISCOVER_ITEM {
	quest::gmsay("$name discovered " . quest::varlink($itemid) . "!", 335, 1, 0, 0);
}

sub EVENT_CLICKDOOR {
    if($status > 200) {
        plugin::Doors_Manipulation_EVENT_CLICKDOOR(); # Door Manipulation Plugin
    }
}
 
sub EVENT_SAY {
    if($status > 200) {
        plugin::Doors_Manipulation_EVENT_SAY(); # Door Manipulation Plugin
    }
}

