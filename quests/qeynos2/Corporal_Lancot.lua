function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s!  Welcome to the fine city of Qeynos! If you wish to join our fight against the evil gnolls of Blackburrow, be sure to talk to Captain Tillin in the Hall of Steel.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
    e.self:Say(string.format("My comrades will avenge my death."));
end