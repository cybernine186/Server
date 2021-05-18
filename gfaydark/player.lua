function event_pvp_slay(e)
	if (e.other:GetRace() == 4 or e.other:GetRace() == 5) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain an Elf within Greater Faydark, the Emerald Warriors will know of your deeds.");
			e.self:Faction(276, -100); -- Kelethin Merchants
			e.self:Faction(246, -100); -- Faydarks Champions
			e.self:Faction(326, -100); -- Emerald Warriors
		end
	end
end