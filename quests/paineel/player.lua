function event_pvp_slay(e)
	if (e.other:GetRace() == 3) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Erudite within Paineel, the Heretics will know of your deeds.");
			e.self:Faction(265, -100); -- Heretics
		end
	end
end