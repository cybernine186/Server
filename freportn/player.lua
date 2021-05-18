function event_pvp_slay(e)
	if (e.other:GetRace() == 1) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Human within Freeport, the Guards of Freeport will know of your deeds.");
			e.self:Faction(229, -100); -- Coalition of Tradefolk
			e.self:Faction(281, -100); -- Knights of Truth
			e.self:Faction(330, -100); -- The Freeport Militia
		end
	end
end