function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("That's it swine! You're outta here!"));
  end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("stanos")) then
		e.self:Say(string.format("Come over here, bub. Listen to me, and don't say a word. That name is one that can get you killed. Hanns wants Stanos dead, Renux wants to please Hanns, and everyone else wants to keep their spinal column intact, you know? So, %s, now you can speak. Where did you hear that name, or did you actually see Stanos somewhere?",e.other:GetName()));
    end
end

function event_death(e)
    e.self:Say(string.format("My comrades will avenge my death."));
end


-- ref: https://wiki.project1999.com/Rogue_Epic_Quest    