function event_death(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 9 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain a Troll within Grobb, DaBashers will know of your deeds.");
			e.other:CastToClient():Faction(376, -100); -- Grobb Merchants
			e.other:CastToClient():Faction(235, -100); -- DaBashers
		end
	end
end