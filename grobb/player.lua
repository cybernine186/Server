function event_pvp_slay(e)
	if (e.other:GetRace() == 9) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Troll within Grobb, DaBashers will know of your deeds.");
			e.self:Faction(376, -100); -- Grobb Merchants
			e.self:Faction(235, -100); -- DaBashers
		end
	end
end