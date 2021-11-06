function event_death(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 8 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain a Dwarf within Kaladim, the Storm Guard will know of your deeds.");
			e.other:CastToClient():Faction(290, -100); -- Merchants of Kaladim
			e.other:CastToClient():Faction(312, -100); -- Storm Guard
		end
	end
end