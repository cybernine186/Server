function event_pvp_slay(e)
	if (e.other:GetRace() == 5 or e.other:GetRace() == 4) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain an Elf within Felwithe, the Emerald Warriors will know of your deeds.");
			e.self:Faction(325, -100); -- Felwithe Merchants
			e.self:Faction(246, -100); -- Faydarks Champions
			e.self:Faction(326, -100); -- Emerald Warriors
		end
	end
end