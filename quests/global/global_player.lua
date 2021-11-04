function event_death(e)

	local victimName = eq.get_char_name_by_id(e.self:CharacterID());
	local victimClass = e.self:GetClassName();
	local victimGuildID = e.self:GuildID();
	local victimGuild = eq.get_guild_name_by_id(victimGuildID);
	local killerName = eq.get_char_name_by_id(e.other:CastToClient():CharacterID());
	local killerClass = e.other:CastToClient():GetClassName();
	local killerGuildID = e.other:CastToClient():GuildID();
	local killerGuild = eq.get_guild_name_by_id(killerGuildID);
	
	--local zone = eq.get_zone_long_name_by_id(e.self:CastToClient():GetZoneID());
	--local zone = e.other:CastToClient():GetZoneID();
	
	local weakArray = {'weakling', 'cowardly', 'lowly peasant', 'eunuch'}
	local killArray = {'killed', 'slain', 'murdered', 'slaughtered', 'beaten to death', 'castrated', 'mutulated', 'mauled'}
	local strongArray = {'great', 'strong', 'cutthroat', 'serial killer', 'murderer', 'champion', 'death dealer', 'sadistic'}
	
	local message = string.format("A %s %s of <%s> has been %s by a %s %s of <%s> in %s",
		weakArray[math.random(#weakArray)], victimClass, victimGuild, killArray[math.random(#killArray)], strongArray[math.random(#strongArray)], killerClass, killerGuild, 'The Arena');
	eq.world_emote(315, message);

end