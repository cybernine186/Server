sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Leave this place or find yourself [bound to this land] as I am.");
	}
	elsif ($text=~/bound to this land/i) {
		quest::say("I was torn to pieces for my failure to complete a task for my master.  I lost my life, my precious [shadowknight armor] and most of all, my [lower body]!!");
	}
	elsif ($text=~/shadowknight armor/i) {
		quest::say("My darkforge armor!!  It was taken into the land of lizards by the lizardmen crusaders!!  It is worthless decayed armor now!! I cannot even wear it any more, but perhaps you can!!  Would you like me to make [darkforge armor] for you?");
	}
	elsif ($text=~/lower body/i) {
		quest::say("My lower body was taken from me, along with my hands.  I was pieced together using portions of other failed champions.  Now I can only create [darkforge armor] in the form of helms, breastplates, vambraces and bracers.");
	}
	elsif ($text=~/darkforge armor/i) {
		quest::say("Darkforge helms require my decayed helm and visor as well as two Freeport militia helms.  The breastplate requires the decayed breastplate, decayed mail and two enchanted platinum bars. Vambraces need both decayed vambraces and a Qeynos Guard kite shield.  The bracers require both decayed bracers and a horn from a minotaur lord.");
	}
}

sub EVENT_ITEM {
	#:: Match a 12283 - Decayed Helm, a 12284 - Decayed Visor, and two 13921 - Damaged Militia Helm
	if (plugin::takeItems(12283 => 1, 12284 => 1, 13921 => 2)) {
		quest::say("You now own the darkforge helm.");
		#:: Give a 3140 - Darkforge Helm
		quest::summonitem(3140);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 12285 - Decayed Breastplate, 12286 - Decayed Chainmail, and two 16507 - Enchanted Platinum Bar
	elsif (plugin::takeItems(12285 => 1, 12286 => 1, 16507 => 2)) {
		quest::say("I grant you the darkforge breastplate!!");
		#:: Give a 3141 - Darkforge Breastplate
		quest::summonitem(3141);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 12288 - Decayed Left Vambrace, a 12287 - Decayed Right Vambrace, and a 9023 - Qeynos Kite Shield
	elsif (plugin::takeItems(12288 => 1, 12287 => 1, 9023 => 1)) {
		quest::say("Well done, $name, here is your reward.");	#:: Not confirmed
		#:: Give a 3142 - Darkforge Vambraces
		quest::summonitem(3142);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Match a 12290 - Decayed Left Bracer, a 12289 - Decayed Right Bracer, and a 19075 - Broken Minotaur Lord's Horn
	elsif(plugin::takeItems(12290 => 1, 12289 => 1, 19075 => 1)) {
		quest::say("Well done, $name, here is your reward.");	#:: Not confirmed
		#:: Give a 3143 - Darkforge Bracer
		quest::summonitem(3143);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(1000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
