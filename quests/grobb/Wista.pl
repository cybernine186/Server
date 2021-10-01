sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hi, do ya likes eatin', or puhaps Hukulk sent ya? I makes many gud eats. Doh, sum I can'ts make cause sum tings I ain't gots. I cud makes some berry tastie stuff wid only [sum wolf meat].");
	}
	elsif ($text=~/sum wolf meat/i) {
		quest::say("Gets me two wolf meats sos I cans makes me foods. I gib ya sumting.");
	}
}

sub EVENT_ITEM {
	if (plugin::takeItems(13403 =>2)) {
		quest::say("Deez berry gud. Makes berry good suff. Me berry happy. Yous gets more bring dem ta mees. Yous takes dis and tanks fer da meats.");
		#:: Give a 17004 - Large Bag
		quest::summonitem(17004);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Set faction
		quest::faction(376, 10);		#:: + Grobb Merchants
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
