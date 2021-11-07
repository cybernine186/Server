function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello, %s! My name is Rashik Hiccs and I would like to welcome you to Qeynos on behalf of all the guards. If you get into trouble, just find one of us and we will help you out.",e.other:GetName()));
	end
end

function event_death_complete(e)
    e.self:Say(string.format("My comrades will avenge my death."));
end
