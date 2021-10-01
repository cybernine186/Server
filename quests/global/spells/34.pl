sub EVENT_SPELL_EFFECT_CLIENT {
	if ($client->GetPetID()) {
		$PetID = $entity_list->GetMobByID($client->GetPetID());
		if ($PetID->Charmed()){
			
		}
		else {
		$PetID->Depop();
		}
		}
	}
 }