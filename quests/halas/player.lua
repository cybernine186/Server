function event_death_complete(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 2 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain a Barbarian within Halas, the Wolves of the North will know of your deeds.");
			e.other:CastToClient():Faction(328, -100); -- Merchants of Halas
			e.other:CastToClient():Faction(320, -100); -- Wolves of the North
		end
	end
end