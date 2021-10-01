sub EVENT_SPAWN {
	#:: Create a timer 'Beware' that triggers every 600 seconds (10 min)
	quest::settimer("Beware", 600);
	#:: Create a timer 'SpawnCondition' that triggers every 5 seconds
	quest::settimer("SpawnCondition", 5);
}

sub EVENT_TIMER {
	#:: Match timer 'SpawnCondition'
	if ($timer eq "SpawnCondition") {
		#:: This was added to PEQ to prevent the entire zone from popping at once
		quest::spawn_condition("fearplane",0,1,0);
		quest::spawn_condition("fearplane",0,1,1);
		#:: Stop the timer 'SpawnCondition'
		quest::stoptimer("SpawnCondition");
	}
	#:: Match timer 'Beware'
	elsif ($timer eq "Beware") {
		quest::shout("Beware all infidels who dare to taint my plane, for I shall rend your minds with fright, dread, and terror!");
		#:: Send a signal '1' to the indicated npc_type id without delay
		quest::signalwith(72029, 1, 0);		#:: Amygdalan_knight
		quest::signalwith(72015, 1, 0);		#:: Amygdalan_warrior
		quest::signalwith(72062, 1, 0);		#:: a_boogeyman
		quest::signalwith(72074, 1, 0);		#:: a_broken_golem
		quest::signalwith(72103, 1, 0);		#:: a_decrepit_warder
		quest::signalwith(72090, 1, 0);		#:: a_dracoliche
		quest::signalwith(72059, 1, 0);		#:: a_fetid_fiend (male)
		quest::signalwith(72065, 1, 0);		#:: a_fetid_fiend (female)
		quest::signalwith(72081, 1, 0);		#:: a_frightfinger
		quest::signalwith(72076, 1, 0);		#:: a_glare_lord
		quest::signalwith(72031, 1, 0);		#:: a_gorgon
		quest::signalwith(72087, 1, 0);		#:: a_nightmare
		quest::signalwith(72102, 1, 0);		#:: a_phantasm
		quest::signalwith(72052, 1, 0);		#:: a_samhain
		quest::signalwith(72094, 1, 0);		#:: a_scareling
		quest::signalwith(72050, 1, 0);		#:: a_shiverback
		quest::signalwith(72058, 1, 0);		#:: a_spinechiller_spider
		quest::signalwith(72057, 1, 0);		#:: a_tentacle_tormentor
		quest::signalwith(72055, 1, 0);		#:: a_turmoil_toad
		quest::signalwith(72022, 1, 0);		#:: a_worry_wraith
		quest::signalwith(72071, 1, 0);		#:: phoboplasm
		quest::signalwith(72001, 1, 0);		#:: Wraith_of_a_Shissir
		quest::signalwith(72000, 1, 0);		#:: Dread
		quest::signalwith(72004, 1, 0);		#:: Fright
		quest::signalwith(72002, 1, 0);		#:: Terror
	}
}

sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::shout("Denizens of Fear, your master commands you to come forth to his aid!!");
		#:: Send a signal '2' to the indicated npc_type id without delay
		quest::signalwith(72029, 2, 0);		#:: Amygdalan_knight
		quest::signalwith(72015, 2, 0);		#:: Amygdalan_warrior
		quest::signalwith(72062, 2, 0);		#:: a_boogeyman
		quest::signalwith(72074, 2, 0);		#:: a_broken_golem
		quest::signalwith(72103, 2, 0);		#:: a_decrepit_warder
		quest::signalwith(72090, 2, 0);		#:: a_dracoliche
		quest::signalwith(72059, 2, 0);		#:: a_fetid_fiend (male)
		quest::signalwith(72065, 2, 0);		#:: a_fetid_fiend (female)
		quest::signalwith(72081, 2, 0);		#:: a_frightfinger
		quest::signalwith(72076, 2, 0);		#:: a_glare_lord
		quest::signalwith(72031, 2, 0);		#:: a_gorgon
		quest::signalwith(72087, 2, 0);		#:: a_nightmare
		quest::signalwith(72102, 2, 0);		#:: a_phantasm
		quest::signalwith(72052, 2, 0);		#:: a_samhain
		quest::signalwith(72094, 2, 0);		#:: a_scareling
		quest::signalwith(72050, 2, 0);		#:: a_shiverback
		quest::signalwith(72058, 2, 0);		#:: a_spinechiller_spider
		quest::signalwith(72057, 2, 0);		#:: a_tentacle_tormentor
		quest::signalwith(72055, 2, 0);		#:: a_turmoil_toad
		quest::signalwith(72022, 2, 0);		#:: a_worry_wraith
		quest::signalwith(72071, 2, 0);		#:: phoboplasm
		quest::signalwith(72001, 2, 0);		#:: Wraith_of_a_Shissir
		quest::signalwith(72000, 2, 0);		#:: Dread
		quest::signalwith(72004, 2, 0);		#:: Fright
		quest::signalwith(72002, 2, 0);		#:: Terror
	}
	#:: Match combat state 0 - left combat
	elsif ($combat_state == 0) {
		#:: Send a signal '3' to the indicated npc_type id without delay
		quest::signalwith(72029, 3, 0);		#:: Amygdalan_knight
		quest::signalwith(72015, 3, 0);		#:: Amygdalan_warrior
		quest::signalwith(72062, 3, 0);		#:: a_boogeyman
		quest::signalwith(72074, 3, 0);		#:: a_broken_golem
		quest::signalwith(72103, 3, 0);		#:: a_decrepit_warder
		quest::signalwith(72090, 3, 0);		#:: a_dracoliche
		quest::signalwith(72059, 3, 0);		#:: a_fetid_fiend (male)
		quest::signalwith(72065, 3, 0);		#:: a_fetid_fiend (female)
		quest::signalwith(72081, 3, 0);		#:: a_frightfinger
		quest::signalwith(72076, 3, 0);		#:: a_glare_lord
		quest::signalwith(72031, 3, 0);		#:: a_gorgon
		quest::signalwith(72087, 3, 0);		#:: a_nightmare
		quest::signalwith(72102, 3, 0);		#:: a_phantasm
		quest::signalwith(72052, 3, 0);		#:: a_samhain
		quest::signalwith(72094, 3, 0);		#:: a_scareling
		quest::signalwith(72050, 3, 0);		#:: a_shiverback
		quest::signalwith(72058, 3, 0);		#:: a_spinechiller_spider
		quest::signalwith(72057, 3, 0);		#:: a_tentacle_tormentor
		quest::signalwith(72055, 3, 0);		#:: a_turmoil_toad
		quest::signalwith(72022, 3, 0);		#:: a_worry_wraith
		quest::signalwith(72071, 3, 0);		#:: phoboplasm
		quest::signalwith(72001, 3, 0);		#:: Wraith_of_a_Shissir
		quest::signalwith(72000, 3, 0);		#:: Dread
		quest::signalwith(72004, 3, 0);		#:: Fright
		quest::signalwith(72002, 3, 0);		#:: Terror
	}
}

sub EVENT_DEATH_COMPLETE {
	#:: Send a signal '3' to the indicated npc_type id without delay
	quest::signalwith(72029, 3, 0);		#:: Amygdalan_knight
	quest::signalwith(72015, 3, 0);		#:: Amygdalan_warrior
	quest::signalwith(72062, 3, 0);		#:: a_boogeyman
	quest::signalwith(72074, 3, 0);		#:: a_broken_golem
	quest::signalwith(72103, 3, 0);		#:: a_decrepit_warder
	quest::signalwith(72090, 3, 0);		#:: a_dracoliche
	quest::signalwith(72059, 3, 0);		#:: a_fetid_fiend (male)
	quest::signalwith(72065, 3, 0);		#:: a_fetid_fiend (female)
	quest::signalwith(72081, 3, 0);		#:: a_frightfinger
	quest::signalwith(72076, 3, 0);		#:: a_glare_lord
	quest::signalwith(72031, 3, 0);		#:: a_gorgon
	quest::signalwith(72087, 3, 0);		#:: a_nightmare
	quest::signalwith(72102, 3, 0);		#:: a_phantasm
	quest::signalwith(72052, 3, 0);		#:: a_samhain
	quest::signalwith(72094, 3, 0);		#:: a_scareling
	quest::signalwith(72050, 3, 0);		#:: a_shiverback
	quest::signalwith(72058, 3, 0);		#:: a_spinechiller_spider
	quest::signalwith(72057, 3, 0);		#:: a_tentacle_tormentor
	quest::signalwith(72055, 3, 0);		#:: a_turmoil_toad
	quest::signalwith(72022, 3, 0);		#:: a_worry_wraith
	quest::signalwith(72071, 3, 0);		#:: phoboplasm
	quest::signalwith(72001, 3, 0);		#:: Wraith_of_a_Shissir
	quest::signalwith(72000, 3, 0);		#:: Dread
	quest::signalwith(72004, 3, 0);		#:: Fright
	quest::signalwith(72002, 3, 0);		#:: Terror
	if ($entity_list->GetMobByID($killer_id)->IsClient()) {
		$characteridbymob = $entity_list->GetClientByID($killer_id)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);
		
		quest::gmsay("[$zoneln] Congratulations to <$guildname>'s member, " . ($entity_list->GetMobByID($killer_id) ? $entity_list->GetMobByID($killer_id)->GetCleanName() : "an unknown hand") . " for being the first to slay Cazic Thule!", 13, 1, 0, 0);
		return;
	}

	if ($entity_list->GetMobByID($killer_id)->IsPet()) {
		$petowner = $entity_list->GetMobByID($killer_id)->GetOwnerID();
		$characteridbymob = $entity_list->GetClientByID($petowner)->CharacterID();
		$guildid = quest::getguildidbycharid($characteridbymob);
		$guildname = quest::getguildnamebyid($guildid);

		quest::gmsay("[$zoneln] Congratulations to <$guildname>'s member, " . ($entity_list->GetMobByID($petowner) ? $entity_list->GetMobByID($petowner)->GetCleanName() : "an unknown hand") . " for being the first to slay Cazic Thule!", 13, 1, 0, 0);
		return; 
	}
}
