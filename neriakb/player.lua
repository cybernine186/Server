function event_pvp_slay(e)
	if (e.other:GetRace() == 6) then
		if (e.self:GetID() ~= e.other:GetID()) then
			e.self:Message(13, "You have slain a Dark Elf within Neriak, the Dreadguard will know of your deeds.");
			e.self:Faction(236, -100);			--#:: + Dark Bargainers
			e.self:Faction(334, -100);				--#:: + Dreadguard Outer
			e.self:Faction(370, -100);				--#:: + Dreadguard Inner
		end
	end
end

function event_click_door(e) 
	local door_id = e.door:GetDoorID();
	local entity_list = eq.get_entity_list();
	if(door_id == 1) then
		entity_list:FindDoor(2):ForceOpen(e.self);
		entity_list:FindDoor(49):ForceOpen(e.self);
	end
	
	if(door_id == 2) then
		entity_list:FindDoor(1):ForceOpen(e.self);
		entity_list:FindDoor(49):ForceOpen(e.self);
	end
	
	if(door_id == 49) then
		entity_list:FindDoor(1):ForceOpen(e.self);
		entity_list:FindDoor(2):ForceOpen(e.self);
	end
end