sub EVENT_SIGNAL{
	#:: Match a signal "1" from /ecommons/Sergeant_Slate.pl if at the given coordinates
	if (($signal==1) && ($x==159) && ($y==-143)) {
		quest::say("All quiet, Sergeant.");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
