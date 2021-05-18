function event_pvp_slay(e)
	if (e.other:GetRace() == 1) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Human within Surefall, the Guards of Qeynos will know of your deeds.");
			e.self:Faction(291, -100); -- Merchants of Qeynos
			e.self:Faction(262, -100); -- Guards of Qeynos
			e.self:Faction(230, -100); -- Corrupt Qeynos Guards
		end
	end
end
