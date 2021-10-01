function event_pvp_slay(e)
	if (e.other:GetRace() == 11) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Halfling within Rivervale, the Guardians of the Vale will know of your deeds.");
			e.self:Faction(300, -100); -- Priest of Mischief
			e.self:Faction(286, -100); -- Mayor Gubbin
			e.self:Faction(263, -100); -- Guardian of the Vale
		end
	end
end