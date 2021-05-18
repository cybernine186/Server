function event_spawn(e)

	eq.set_timer("TimeCheck",500);
	
    local zone_time = eq.get_zone_time();


end

function event_timer(e)
	local zone_time = eq.get_zone_time();

	if(e.timer == "TimeCheck") then
		if(zone_time["zone_hour"] == 19) then
			eq.set_timer("nighttoday",36000);
		end
		if(zone_time["zone_hour"] == 7) then
			eq.set_timer("daytonight",36000);
		end
	end

	if(e.timer == "nighttoday") then
		eq.clear_spawn_timers();
		eq.repop_zone();
		eq.stop_timer("nighttoday");
	end
	if(e.timer == "daytonight") then
		eq.clear_spawn_timers();
		eq.repop_zone();
		eq.stop_timer("daytonight");
	end
end