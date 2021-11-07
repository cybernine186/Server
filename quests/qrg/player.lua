function event_death_complete(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 1 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain a Human within Surefall, the Guards of Qeynos will know of your deeds.");
			e.other:CastToClient():Faction(291, -100); -- Merchants of Qeynos
			e.other:CastToClient():Faction(262, -100); -- Guards of Qeynos
			e.other:CastToClient():Faction(230, -100); -- Corrupt Qeynos Guards
		end
	end
end
