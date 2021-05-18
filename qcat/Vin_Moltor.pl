sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Heh?? .. BURRP!.. Leave me be will ya.");
	}
	elsif ($text=~/paw of opolla/i) {
		quest::say("Paw ya say? Yeah.. Yeah .. I got this ratty old thing still. You want it? Its yours for a Bottle of Kalish and hm.. .. How bad you want it?  Hm..  Two..  No no..  Three Gold..  Er..  NO! Wait. Pie..  Yes! Rat Ear Pie is what I want.. Three Bottles of Kalish and a Rat Eat Pie. If you want the Paw that is my price.");
	}
}

sub EVENT_ITEM {
	#:: Match three 13016 - Bottle of Kalish, and a 13192 - Rat Ear Pie
	if (plugin::takeItems(13016 => 3, 13192 => 1)) {
		quest::say("Ah thanks, here is what I promised you.");
		#:: Give a 17014 - Severed Paw
		quest::summonitem(17014);
	}
	#:: Match three 13016 - Bottle of Kalish, and a 18103 - Rat Ear Pie
	elsif (plugin::takeItems(13016 => 3, 18103 => 1)) {
		quest::say("Ah thanks, here is what I promised you.");
		#:: Give a 17014 - Severed Paw
		quest::summonitem(17014);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
