function event_death_complete(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 1 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain a Human within Freeport, the Guards of Freeport will know of your deeds.");
			e.other:CastToClient():Faction(229, -100); -- Coalition of Tradefolk
			e.other:CastToClient():Faction(281, -100); -- Knights of Truth
			e.other:CastToClient():Faction(330, -100); -- The Freeport Militia
		end
	end
end