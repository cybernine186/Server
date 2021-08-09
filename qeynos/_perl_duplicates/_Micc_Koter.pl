#:: Create a scalar variable to store an item count
my $ItemCount;

sub EVENT_SPAWN {
	#:: Create a proximity, 100 units across, 100 units tall, and enable proximity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 1);
	#:: Reset item count on spawn
	$ItemCount = 0;
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Oh, hello, $name.  Don't mind my associate Klieb over there.  He gets quite grumpy when he drinks.  We are relatively new here ourselves but have made some fast friends in Qeynos.  This is a city of opportunity.");
	}
	elsif ($text=~/paw of opolla/i) {
			quest::say("Some guy, don't know who he was, was in here claiming he had a lead where to find some information on the Paw of Opolla. I don't know anything about it except it is supposed to be the paw of some old gnoll bitch and have some magic powers. Buy me a Brandy and I might tell you where he was going.");
	}
	elsif ($text=~/ranger/i) {
			quest::say("Beats me. Try going to the north near Surefall Glade. That is where those goodie goodies tend to hang out.");
	}
}


sub EVENT_PROXIMITY_SAY {
	if ($text=~/gnoll/i) {
		quest::say("A gnoll is a stupid dog that walks upright. They are dirty and stinky and hate humans. Just like my pal Klieb here. Heh!");
		#:: Send a signal "1" to South Qeynos >> Klieb_Torne (1071) with no delay
		quest::signalwith(1071, 1, 0);
	}
}

sub EVENT_SIGNAL {
	#:: Match a signal "1" from qeynos/Klieb_Torne.pl
	if ($signal == 1) {
		quest::say("Ha ha ha ha!");
	}
	#:: Match a signal "2" from qeynos/Klieb_Torne.pl
	elsif ($signal == 2) {
		quest::say("Lighten up, will ya, Klieb? You act like a dang [gnoll] sometimes..");
	}
}

sub EVENT_ITEM {
	#:: Match two 13034 - Brandy
	if (plugin::takeItems(13034 => 2)) {
		quest::say("Oh yes. Now I remember.. Ha ha.. He said he was going into the Plains of Karana to look for some gnoll lover by the name of Caninel. He said Caninel knew something about the location of the Paw of Opolla. It sounds like a bunch of rat crap to me, I never heard of no one named Caninel. But off he went.. Heck , finding one person in the Plains of Karana without a [ranger] to guide you is like looking for a clean spot on ol'Klieb here. Ha ha!!");
		#:: Reset item count
		$ItemCount = 0;
	}
	#:: Match one 13034 - Brandy
	elsif (plugin::takeItems(13034 => 1)) {
		if ($ItemCount == 0) {
			quest::say("Hey.. Better get me another one.. I can't quite remember.. Heh heh..");
			#:: Increment the item count variable
			$ItemCount++;
		}
		else {
			quest::say("Oh yes. Now I remember.. Ha ha.. He said he was going into the Plains of Karana to look for some gnoll lover by the name of Caninel. He said Caninel knew something about the location of the Paw of Opolla. It sounds like a bunch of rat crap to me, I never heard of no one named Caninel. But off he went.. Heck , finding one person in the Plains of Karana without a [ranger] to guide you is like looking for a clean spot on ol'Klieb here. Ha ha!!");
			#:: Reset item count
			$ItemCount = 0;
		}
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
