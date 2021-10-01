function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah... Welcome friend. I am Master Seta of the Silent Fist Clan. We know that true strength lies inside your soul. Once you have found and mastered it, your fists will be deadlier than any blade. I am also currently in charge of training our new recruits.");
	elseif(e.message:findi("tomer instogle")) then
		e.self:Say("Oh, Tomer? We haven't heard from him in days, I'm really starting to worry... We need to have someone go [find him].");
	elseif(e.message:findi("find him")) then
		e.self:Say(string.format("Tomer has not reported back in over three days. He was sent to help defend the Qeynos gates, and we haven't heard from him since. We need you to find him, if he is still alive. Tell him that Seta has sent you to find him, and escort him back to our guild. Good luck, %s.",e.other:GetName()));
        -- set databucket key/value pair here
        eq.set_data("tomers_rescue", "started");
    elseif(e.message:findi("rescued") or (e.message:findi("found")) then
        e.self:Say(string.format("Great work, %s! We thought that was the last we'd seen of young Tomer.",e.other:GetName()));
        -- update databucket to next step
        eq.set_data("tomers_rescue", "finished");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end

-- ref: https://wiki.project1999.com/Tomer%27s_Rescue


