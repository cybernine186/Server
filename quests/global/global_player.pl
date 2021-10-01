
sub EVENT_DEATH_COMPLETE  {
	$guildslain = quest::getguildnamebyid($uguild_id);
	my %team = (
		201 => Evil,
		203 => Evil,
		206 => Evil,
		211 => Evil,
		202 => Neutral,
		205 => Neutral,
		207 => Neutral,
		209 => Neutral,
		213 => Neutral,
		214 => Neutral,
		216 => Neutral,
		204 => Good,
		208 => Good,
		210 => Good,
		212 => Good,
		215 => Good
		);
	
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
		
		quest::gmsay("[PVP] $name <$guildslain> of the $team{$killeddeitycheck} team has been killed by " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . " <$guildname> of the $team{$killerdeitycheck} team in $zoneln!", 315, 1, 0, 0);

		return;
		
		
	}
	
	if ($entity_list->GetMobByID($killer_id) && $entity_list->GetMobByID($killer_id)->IsPet()) {
		$petowner = $entity_list->GetMobByID($killer_id)->GetOwnerID();
		$characteridbymob = $entity_list->GetClientByID($petowner)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);
		$killerdeitycheck = $entity_list->GetMobByID($petowner)->GetDeity();
		$killeddeitycheck = $client->GetDeity();

		quest::gmsay("[PVP] $name <$guildslain> of the $team{$killeddeitycheck} team has been killed by " . ($entity_list->GetMobByID($petowner) ? $entity_list->GetMobByID($petowner)->GetCleanName() : "an unknown hand") . " <$guildname> of the $team{$killerdeitycheck} team in $zoneln!", 315, 1, 0, 0);

		
		return; 
		
	}
}

sub EVENT_ZONE {
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


sub EVENT_DISCOVER_ITEM {
	quest::gmsay("$name discovered " . quest::varlink($itemid) . "!", 335, 1, 0, 0);
}

sub EVENT_ENTERZONE {
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
	plugin::HandleOnlineList($client);  
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

sub EVENT_SERVERFIRST_LEVEL {
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

