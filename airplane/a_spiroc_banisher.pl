sub EVENT_DEATH_COMPLETE_COMPLETE {
	#:: Match a The Plane of Sky >> a_spiroc_vanquisher (71009) on the entity list
	if ($entity_list->GetMobByNpcTypeID(71009)) {
		#:: Update spawn point to respawn in 1000ms (1 sec)
		quest::updatespawntimer(2623, 1000);
	}
}
