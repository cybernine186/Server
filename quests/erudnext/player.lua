function event_pvp_slay(e)
	if (e.other:GetRace() == 3) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain an Erudite within Erudin, the Emerald Warriors will know of your deeds.");
			e.self:Faction(289, -100); -- Merchants of Erudin
			e.self:Faction(267, -100); -- High Guard of Erudin
		end
	end
end