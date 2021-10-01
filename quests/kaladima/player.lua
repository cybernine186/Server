function event_pvp_slay(e)
	if (e.other:GetRace() == 8) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Dwarf within Kaladim, the Storm Guard will know of your deeds.");
			e.self:Faction(290, -100); -- Merchants of Kaladim
			e.self:Faction(312, -100); -- Storm Guard
		end
	end
end