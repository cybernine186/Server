function event_death(e)

	if(e.self:IsNPC()) then
		return;
	end
	
	if(e.other:IsNPC() and e.other:IsPet() == false) then
		return;
	end

	local victimName = eq.get_char_name_by_id(e.self:CharacterID());
	local victimClass = e.self:GetClassName();
	local victimGuildID = e.self:GuildID();
	local victimGuild = eq.get_guild_name_by_id(victimGuildID);
	local killerName;
	local killerClass;
	local killerGuildID;
	
	if(e.other:IsPet()) then
		killerName = eq.get_char_name_by_id(e.other:GetOwner():CastToClient():CharacterID());
		killerClass = e.other:GetOwner():CastToClient():GetClassName();
		killerGuildID = e.other:GetOwner():CastToClient():GuildID();
	elseif (e.other:IsClient()) then
		killerName = eq.get_char_name_by_id(e.other:CastToClient():CharacterID());
		killerClass = e.other:CastToClient():GetClassName();
		killerGuildID = e.other:CastToClient():GuildID();
	else
		killerName = eq.get_char_name_by_id(e.killer_id);
		killerClassID = eq.get_char_class_by_id(e.killer_id);
		killerClass = eq.get_class_name(tonumber(killerClassID));
		killerGuildID = eq.get_guild_id_by_char_id(e.killer_id);
	end
	
	local killerGuild = eq.get_guild_name_by_id(killerGuildID);
	local zone = eq.get_zone_short_name_by_id(eq.get_zone_id());
	local weakArray = {'weakling', 'cowardly', 'lowly peasant', 'eunuch'}
	local killArray = {'killed', 'slain', 'murdered', 'slaughtered', 'beat to death', 'castrated', 'mutilated', 'mauled'}
	local strongArray = {'cutthroat', 'killer', 'murdering', 'death dealing', 'sadistic'}

	local message = string.format("[PVP] [%s] A %s %s of <%s> has been %s by a %s %s of <%s>.",
		zone, weakArray[math.random(#weakArray)], victimClass, victimGuild, killArray[math.random(#killArray)], strongArray[math.random(#strongArray)], killerClass, killerGuild);
	
	eq.world_emote(315, message);
end