sub EVENT_ENTERZONE {
    if ($status < 80) {
        if($client->BuffCount()) {
            for($i=0; $i < $client->BuffCount(); $i++) {
                if($client->FindBuffBySlot($i) !~ [756, 757, 5249])    {#:: Rezz sickness
                    $client->BuffFadeBySlot($i);
                }
            }    
        }
    }
	$client->Message(13, "You have entered a zone with no PvP level range restrictions."); 
}
