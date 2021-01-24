function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	elseif(e.message:findi("challenge eejag")) then
		eq.spawn2(27119,0,0,350.75,1093.50,-12,0); -- NPC: Eejag
		eq.depop_with_timer();
	end
end
