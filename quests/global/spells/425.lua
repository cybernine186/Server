function event_spell_effect(e)
  eq.set_timer("size", 10);
end

function event_timer(e)
  if (e.timer == "size") then
    e.target:ChangeSize(12);
  end
end