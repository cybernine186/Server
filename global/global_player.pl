
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

		#quest::gmsay("[PVP] $name of <$guildslain> has been killed by $killer_name of <$guildname> in $zoneln!", 315, 1, 0, 0); 
		
		quest::we(315,"[PVP] $name of <$guildslain> has been killed by $killer_name of <$guildname> in $zoneln!"); 
		#Lets use world emote instead of GM say to see if it picks up on Discord EQ bot
		return;
		
	}
	
	if ($entity_list->GetMobByID($killer_id)->IsClient()) {
		$characteridbymob = $entity_list->GetClientByID($killer_id)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);
		
		#quest::gmsay("[PVP] $name of <$guildslain> has been killed by " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . " of <$guildname> in $zoneln!", 315, 1, 0, 0);

		quest::we(315,"[PVP] $name of <$guildslain> has been killed by  " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . " of <$guildname> in $zoneln!"); 
		#Lets use world emote instead of GM say to see if it picks up on Discord EQ bot
		return;
		
		
	}
	
	if ($entity_list->GetMobByID($killer_id)->IsPet()) {
		$petowner = $entity_list->GetMobByID($killer_id)->GetOwnerID();
		$characteridbymob = $entity_list->GetClientByID($petowner)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);

		#uest::gmsay("[PVP] $name of <$guildslain> has been killed by " . ($entity_list->GetMobByID($petowner) ? $entity_list->GetMobByID($petowner)->GetCleanName() : "an unknown hand") . " of <$guildname> in $zoneln!", 315, 1, 0, 0);
		quest::we(315,"[PVP] $name of <$guildslain> has been killed by  " . ($entity_list->GetMobByID($petowner) ? $entity_list->GetMobByID($petowner)->GetCleanName() : "an unknown hand") . " of <$guildname> in $zoneln!"); 

		
		return; 
		
	}
}

sub EVENT_ZONE {
	if ($status < 255) {
		$client->SetGM(0);
	}
	else {
		
	}
	#:: Figure out if the player has a pet and blow it up when they leave a zone
	if ($client->GetPetID()) {
		$PetID = $entity_list->GetMobByID($client->GetPetID());
		if ($PetID->Charmed()){
			
		}
		else {
		$PetID->Depop();
		}
	}
}

sub EVENT_CONNECT {
	
	if ($status < 255) {
		$client->SetGM(0);
	}
	else {
		
	}	
		
}


sub EVENT_DISCOVER_ITEM {
	quest::gmsay("$name discovered " . quest::varlink($itemid) . "!", 335, 1, 0, 0);
}

sub EVENT_ENTERZONE {
	if ($status < 255) {
		$client->SetGM(0);
	}
	else {
		
	}
	
	#:: Figure out if the player has a pet and blow it up when they leave a zone
	if ($client->GetPetID()) {
		$PetID = $entity_list->GetMobByID($client->GetPetID());
		if ($PetID->Charmed()){
			
		}
		else {
		$PetID->Depop();
		}
	}
}


sub EVENT_LEVEL_UP {
	$levelcheck = $client->GetLevel();
	$classcheck = $client->GetClass();
	$namecheck = $client->GetCleanName();
	$guildnamecheck = $client->GuildID();
	$guildname = quest::getguildnamebyid($guildnamecheck);
	$cleanclass = quest::getclassname($classcheck);
	$Racecheck = $client->GetRace();
	$cleanrace = quest::getracename($Racecheck);
	
	if($levelcheck == 5 or $levelcheck == 10 or $levelcheck == 15 or $levelcheck == 20 or $levelcheck == 25 or $levelcheck == 30 or $levelcheck == 35 or $levelcheck == 40 or $levelcheck == 45 or $levelcheck == 50 or $levelcheck == 55 or $levelcheck == 60) {
		quest::gmsay("[Achievement] Congratulations to $namecheck of <$guildname> for becoming the first level $levelcheck $cleanrace $cleanclass!", 257, 1, 0, 0); 
	}
	
	if($classcheck == 1 or $classcheck == 7 or $classcheck == 9) {
		if (quest::is_the_ruins_of_kunark_enabled()) {
			quest::traindiscs($levelcheck,($levelcheck - 1));
		}
	}
	elsif($classcheck == 3 or $classcheck == 4 or $classcheck == 5) {
		if (quest::is_the_scars_of_velious_enabled()) {
			quest::traindiscs($levelcheck,($levelcheck - 1));
		}
	}
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

