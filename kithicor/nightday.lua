function event_spawn(e)

	eq.set_timer("TimeCheck",500);
	
    local zone_time = eq.get_zone_time();

	local nigthrepopped = false;
	local dayrepopped = false;

end

function event_timer(e)
	local zone_time = eq.get_zone_time();

	if(e.timer == "TimeCheck") then
		if(zone_time["zone_hour"] == 19 and nigthrepopped == false) then
			eq.clear_spawn_timers();
			eq.repop_zone();
			local nigthrepopped = true;
			local dayrepopped = false;
		end
		if(zone_time["zone_hour"] == 7 and dayrepopped == false) then
			eq.clear_spawn_timers();
			eq.repop_zone();
			local dayrepopped = true;
			local nigthrepopped = false;
		end
	end
end