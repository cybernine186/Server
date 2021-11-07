function event_death(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 11 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain a Halfling within Rivervale, the Guardians of the Vale will know of your deeds.");
			e.other:CastToClient():Faction(300, -100); -- Priest of Mischief
			e.other:CastToClient():Faction(286, -100); -- Mayor Gubbin
			e.other:CastToClient():Faction(263, -100); -- Guardian of the Vale
		end
	end
end