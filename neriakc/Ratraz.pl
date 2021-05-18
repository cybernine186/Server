sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Come and feel the blade of the Dark Bargainers.");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Spend your money or get out! This ain't no pansy social club!");
	}
	elsif ($text=~/mask/i) {
		quest::say("The Ebon Mask is the rogue's guild in Neriak. Get oughta' my face now. I am not an information booth.");
	}
	elsif ($text=~/happy love bracers|green bracers/i) {
		quest::say("You are inquiring about my bracers? I got 'em from some troll named [Lumpin]. He used to be my enemy, but he called a truce and gave me these here fancy bracers. Ha! I will never give these up. What a wimp! I just wish these names were not on here... [Hukulk] and [Lynuga].");
	}
	elsif ($text=~/lumpin/i) { 
		quest::say("Lumpin is a new guard detached to the Foreign Quarter in Neriak. He and I got into it once when his lady friend was makin' a pass at old Ratraz. Since he wimped out and called a truce and gave me these [green bracers], I decided not to pummel him.");
	}
	elsif ($text=~/hukulk/i) {
		quest::say("I have no idea who Hukulk is, but [Lynuga] and he musta been an item. That's why their names are engraved on these here [green bracers].");
	}
	elsif ($text=~/lynuga/i) {
		quest::say("Lynuga was some troll lady friend of some other peon troll named [Lumpin].");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_DEATH_COMPLETE {
	quest::say("Unngh... Why you kill me? Probably for dumb bracers guard give to me. Dey not even Ratraz's... You now cross da Dark Bargainers and all Neriak be gettin' revenge for Ratraz.");
}
