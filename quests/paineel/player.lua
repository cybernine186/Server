function event_death(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 3 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain a Erudite within Paineel, the Heretics will know of your deeds.");
			e.other:CastToClient():Faction(265, -100); -- Heretics
		end
	end
end