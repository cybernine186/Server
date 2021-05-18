function event_pvp_slay(e)
	if (e.other:GetRace() == 12) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Gnome within Akanon, King Ak'Anon will know of your deeds.");
			e.self:Faction(333, -100); -- King Ak`Anon
			e.self:Faction(288, -100); -- Merchants of Ak`Anon
		end
	end
end