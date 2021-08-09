function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. Please feel free to browse. We make the finest boots in all of Antonica.");
	elseif(e.message:findi("treant wood")) then
		e.self:Say("Looking for Treant material? I do not work with such material. Ask Rodgar. I believe he is upstairs.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end

