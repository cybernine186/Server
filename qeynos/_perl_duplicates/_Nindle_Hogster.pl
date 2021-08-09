sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello! You should take up fishing. It really relieves the stress that accompanies heavy adventuring.");
	}
	elsif ($text=~/donate/i) {
		quest::say("First someone asks me to donate to Prexus and now this. Don't you people have better things to do than beg from us hard working citizens?");
	}
	elsif ($text=~/prexus/i) {
		quest::say("Prexus!? I should have figured you for one of those Prexus fanatics. Why don't you go take a dip in the harbor?! I hear the sharks are hungry. You should take a trip to the aqueducts. You might find a fellow Prexus praiser named Bait Masterson. He loves to sneak down there at night.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
