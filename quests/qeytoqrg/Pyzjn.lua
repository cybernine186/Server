function event_spawn(e)
	local random = math.random(500,1500);
	eq.set_timer("roam",random);
	
	eq.set_timer("TimeCheck",500);
	
    local zone_time = eq.get_zone_time();
	local random_result = math.random(100);
	local pyzjn = 4147;

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
	
	if(e.timer == "roam") then
		e.self:RandomRoam(4000, 4000);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, Pyzjn is working for Master Varsoon. If Pyzjn do good work maybe Master Varsoon tell Master Bruax he is worthy. Pyzjn must go now. All glory to the Plaguebringe! May you die a painful, oozing death.");
	end
end