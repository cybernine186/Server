function event_pvp_slay(e)
	if (e.other:GetRace() == 2) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Barbarian within Halas, the Wolves of the North will know of your deeds.");
			e.self:Faction(328, -100); -- Merchants of Halas
			e.self:Faction(320, -100); -- Wolves of the North
		end
	end
end