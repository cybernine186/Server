sub EVENT_DEATH_COMPLETE {
	#:: Spawn Steamfont Mountains >> a_young_plague_rat (56086)
	quest::spawn2(56086,0,0,$x,$y,$z,$h);
	quest::spawn2(56086,0,0,$x+5,$y+5,$z,$h);
	quest::spawn2(56086,0,0,$x+5,$y-5,$z,$h);
	quest::spawn2(56086,0,0,$x-5,$y+5,$z,$h);
	quest::spawn2(56086,0,0,$x-5,$y-5,$z,$h);
}
