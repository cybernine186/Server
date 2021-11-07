function event_death_complete(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 10 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain a Ogre within Oggok, the Oggok Guards will know of your deeds.");
			e.other:CastToClient():Faction(338, -100); -- Merchants of Oggok
			e.other:CastToClient():Faction(337, -100); -- Oggok Guards
		end
	end
end