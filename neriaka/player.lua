function event_pvp_slay(e)
	if (e.other:GetRace() == 6) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Dark Elf within Neriak, the Dreadguard will know of your deeds")
			e.self:Faction(236, -100);			--#:: + Dark Bargainers
			e.self:Faction(334, -100);				--#:: + Dreadguard Outer
			e.self:Faction(370, -100);				--#:: + Dreadguard Inner
		end
	end
end