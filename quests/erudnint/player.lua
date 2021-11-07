function event_death_complete(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 3 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain an Erudite within Erudin, the Citizens of Erudin will know of your deeds.");
			e.other:CastToClient():Faction(289, -100); -- Merchants of Erudin
			e.other:CastToClient():Faction(267, -100); -- High Guard of Erudin
		end
	end
end