function event_spawn(e)

    local zone_time = eq.get_zone_time();
	local random_result = math.random(100);
	local pyzjn = 4147;
	local varsoon = 4171;

    if(zone_time["zone_hour"] >= 0 and zone_time["zone_hour"] <= 7) or (zone_time["zone_hour"] >= 19 and zone_time["zone_hour"] <= 24) then
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(pyzjn) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(varsoon) == false) then
			if random_result > 0 and random_result <= 4 then
				eq.spawn2(4147,0,0,-97,4187,-57,206); -- NPC: Pyzjn
			end
			if random_result > 4 and random_result <= 8 then
				eq.spawn2(4171,0,0,-97,4187,-57,206); -- NPC: Varsoon
			end
		end
    else
       
    end
end


function event_death_complete(e)

    local zone_time = eq.get_zone_time();
	local random_result = math.random(100);
	local pyzjn = 4147;
	local varsoon = 4171;

    if(zone_time["zone_hour"] >= 0 and zone_time["zone_hour"] <= 7) or (zone_time["zone_hour"] >= 19 and zone_time["zone_hour"] <= 24) then
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(pyzjn) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(varsoon) == false) then
			if random_result > 0 and random_result <= 4 then
				eq.spawn2(4147,0,0,-97,4187,-57,206); -- NPC: Pyzjn
			end
			if random_result > 4 and random_result <= 8 then
				eq.spawn2(4171,0,0,-97,4187,-57,206); -- NPC: Varsoon
			end
		end
    else
       
    end
end