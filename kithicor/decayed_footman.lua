function event_spawn(e)
	local random = math.random(500,1500);
	eq.set_timer("roam",random);
	
	eq.set_timer("TimeCheck",500);
	
    local zone_time = eq.get_zone_time();

    if(zone_time["zone_hour"] >= 0 and zone_time["zone_hour"] <= 7) or (zone_time["zone_hour"] >= 19 and zone_time["zone_hour"] <= 24) then
		
    else
       eq.depop();
    end
end

function event_timer(e)
	local zone_time = eq.get_zone_time();
	if(e.timer == "TimeCheck") then
		if(zone_time["zone_hour"] >= 0 and zone_time["zone_hour"] <= 7) or (zone_time["zone_hour"] >= 19 and zone_time["zone_hour"] <= 24) then
	
		else
			eq.depop();
		end
	end
end