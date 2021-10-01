sub EVENT_DEATH_COMPLETE {
	quest::say("You may have won this battle, my friend, but I shall rise again... and one day, all shall know the true power of the Burning Dead!");
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
