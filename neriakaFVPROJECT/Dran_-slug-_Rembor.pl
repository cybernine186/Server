sub EVENT_SAY {
	#:: Match text ithvol, case independent and a 1370 - Disciple Symbol of Innoruuk
	if ($text=~/ithvol/i && plugin::check_hasitem($client, 1370)) {
		quest::say("So you're the lucky errand boy, eh?! Let's hope you are more successful than the last chump who was sent. From what I hear, there was something pretty important in that last crate that was sent out. It just looked like a bunch of junk to me. Anyhow, we ran out of steel boning. Bring me two bonings so we can bind up the crate and be quick about it! Both of our necks are on the line!");
	}
}

sub EVENT_ITEM {
	#:: Match two 12073 - Steel Boning
	if (plugin::takeItems(12073 => 2)) {
		quest::say("Here's the crate of provisions. Take this to Dragoon Szorn in the Lesser Faydark immediately!");
		#:: Give a 19030 - Crate of Teir`Dal Provisions
		quest::summonitem(19030);
	}
	#:: Match a 12073 - Steel Boning
	elsif(plugin::takeItems(12073 => 1)) {
		quest::say("Gee, thanks, but I can't do a whole lot without the rest! Get your act straight or we're both dead!");
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
