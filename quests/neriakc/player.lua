function event_death_complete(e)
	if(eq.get_rule('PVP:FactionCityKilling') == 'true') then
		if(e.self:GetRace() == 6 and e.self:GetID() ~= e.other:GetID()) then
			e.other:Message(13, "You have slain a Dark Elf within Neriak, the Dreadguard will know of your deeds.");
			e.other:CastToClient():Faction(236, -100);			--#:: + Dark Bargainers
			e.other:CastToClient():Faction(334, -100);				--#:: + Dreadguard Outer
			e.other:CastToClient():Faction(370, -100);				--#:: + Dreadguard Inner
		end
	end
end