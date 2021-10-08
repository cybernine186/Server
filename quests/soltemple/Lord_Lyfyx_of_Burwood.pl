sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::doanim(24);
		quest::emote("bows as a courtesy. His face gleams as if tinged with red.  'Greetings, my friend. Welcome to the Temple of Ro, sanctuary to those who follow the words of the Burning Prince.' ");
	}
	elsif ($text=~/burning prince/i) {
		quest::emote("closes his eyes and shakes his head in sorrow. 'Far away and better forgotten.'");
	}
	elsif ($text=~/ro/i) {
		quest::emote("closes his eyes and shakes his head in sorrow. 'Far away and better forgotten.'");
	}
	elsif ($text=~/scale/i) {
		quest::say("Tektite and peridot shall get you what you desire.");
	}
	elsif ($text=~/xyfyl/i) {
		quest::say("So you can pronounce my name backwards..  Is that your lot in life?  Pronouncing names backwards?  Be gone with your silliness!  We need no court fool.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10028 - Peridot, and a 12831 - Tektite
	if (plugin::takeItems(10028 => 1, 12831 => 1)) {
		quest::emote("places the gems inside an ornate metal box.  He begins to tug at his skin.  Your vision blurs as he performs his magic. 'This is what you seek.  Now leave and bother me no further.' ");
		#:: Give a 12952 - Dragon Scales
		quest::summonitem(12952);
		#:: Ding
		quest::ding();
		#:: Set factions
		quest::faction(415, 10);		#:: + Temple of Solusek Ro
		quest::faction(416, -1);		#:: - Shadowed Men
		#:: Grant a large amount of experience
		quest::exp(50000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
