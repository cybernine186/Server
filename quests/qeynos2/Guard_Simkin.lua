function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Heh? %s. Huh? What do you want? Can't you see I am a busy man guarding and protecting you weaklings...  er... citizens? You better just move along before something happens to you!",e.other:GetName()));
	end
end

function event_death_complete(e)
    e.self:Say(string.format("My comrades will avenge my death."));
end