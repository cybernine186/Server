function event_pvp_slay(e)
	if (e.other:GetRace() == 10) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Ogre within Oggok, the Oggok Guards will know of your deeds.");
			e.self:Faction(338, -100); -- Merchants of Oggok
			e.self:Faction(337, -100); -- Oggok Guards
		end
	end
end