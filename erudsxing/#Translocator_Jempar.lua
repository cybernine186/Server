function event_spawn(e)
	eq.set_timer("depop",120000); --Despawn after 2 minutes
	e.self:Shout("The boat to Qeynos and Erudin has arrived, please board quickly!");
end
  
function event_timer(e)
	eq.stop_timer("depop");
	eq.depop_with_timer();
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to travel to [" .. eq.say_link("Qeynos",false,"Qeynos") .. "] or [" .. eq.say_link("Erudin",false,"Erudin") .. "] in the meantime, I can transport you to my companion there.");
	elseif(e.message:findi("qeynos")) then
		e.self:Say("On your way");
		eq.SelfCast(2288);
	elseif(e.message:findi("erudin")) then
		e.self:Say("On your way");
		eq.SelfCast(2290);
  end
end