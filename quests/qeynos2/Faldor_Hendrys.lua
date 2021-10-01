function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("What, %s? Do I look like a merchant to you? Just because all these merchants are in my library, it doesn't mean that I am one. If you are interested in something other than spell scrolls, then, we can talk.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
