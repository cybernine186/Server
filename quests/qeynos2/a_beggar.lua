function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("I shall chop you down as your people chopped down the beauty of the forests!"));
  end
end

function event_trade(e)
	local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
    e.self:Say(string.format("...Long live the green..."));
end