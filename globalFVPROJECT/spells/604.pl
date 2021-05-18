#:: Evacuate: Ro

sub EVENT_SPELL_EFFECT_CLIENT {
	#:: Zone 35 - sro, $x (effect_base_value2), $y (effect_base_value1), $z (effect_base_value3), $heading (effect_base_value4)
	quest::movepc(35, 125, -1044, 11, 0);
}
