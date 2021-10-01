function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How dare you disturb me! You people need to just mind your pathetic lives and leave the rest to us. Leave me now!");
	end
end

-- THE CRATE (EVIL): 
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18824})) then -- Item: Slip of Parchment
		local random_copper = math.random(16);
		local random_silver = math.random(8);
		e.self:Say("What is this? Hmmm. It seems Weleth has a problem with following orders. I will deal with him. Good work in bringing this to my attention. Our job here would be much more difficult without the help of loyal citizens like yourself. Take this as a token of Commander Kane's appreciation.");
		e.other:Ding();
		e.other:Faction(230, 10,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(262, -20,0); -- Faction: Guards of Qeynos
		e.other:Faction(273, 10,0); -- Faction: Kane Bayle
		e.other:Faction(223, 10,0); -- Faction: Circle Of Unseen Hands
		e.other:Faction(221, 10,0); -- Faction: Bloodsabers
		e.other:AddEXP(32000);
		e.other:GiveCash(random_copper,random_silver,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_death(e)
    e.self:Say(string.format("My comrades will avenge my death."));
end