sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Welcome to my humble shop. I offer fine items fashioned from the skins of the beasts of Everfrost. Leather is my specialty and I can always use [extra hides].");
	}
	elsif ($text=~/extra hides/i) {
		quest::say("I will offer any hunter some used Tattered Armor for every Polar Bear Skin. I am sure that even you can wrestle the skins from the back of a polar bear cub.");
	}
	elsif ($text=~/second job/i) {
		quest::say("I have seen the warriors bringing in items called Wrath Orc Wristbands. Apparently they find them upon the lifeless bodies of the snow orc troopers. They are made from a skin I have yet to find. I will gladly reward you with either a Rawhide Tunic or Leggings or even perhaps Leather Gloves. All I ask for are Two Wrath Orc Wristbands..");
	}
	elsif ($text=~/mammoth hide parchment/i) {
		quest::say("Oh, for Jinkus? Ok, here you go.");
		#:: Give a 12621 - Mammoth Hide Parchment
		quest::summonitem(12621);
	}
}
	
sub EVENT_ITEM {
	#:: Match a 13761 - Polar Bear Skin
	if (plugin::takeItems(13761 => 1)) {
		quest::say("This is much appreciated.  Please accept this used armor in return and also a gold piece for yer troubles.  You have done well! I may have a [second job] fer ye, if ye like?");
		#:: Give a random item: 2130 - Large Patchwork Cloak, 2131 - Large Tattered Belt, 2132 - Large Patchwork Sleeves, 2134 - Large Tattered Gloves, 2135 - Large Patchwork Pants, 2136 - Large Patchwork Boots, 2127 - Large Tattered Gorget, 2126 - Large Tattered Mask, 2128 - Large Patchwork Tunic, 2129 - Large Tattered Shoulderpads, 2125 - Large Tattered Skullcap, 2133 - Large Tattered Wristbands
		quest::summonitem(quest::ChooseRandom(2130, 2131, 2132, 2134, 2135, 2136, 2127, 2126, 2128, 2129, 2125, 2133));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(328, 5); 	#:: + Merchants of Halas
		quest::faction(320, 3);		#:: + Wolves of the North
		quest::faction(327, 3);		#:: + Shamen of Justice
		quest::faction(305, -5);	#:: + Rogues of the White Rose
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 90 to 110cp
		my %cash = plugin::RandomCash(90,110);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Match two 12223 - Wrath Orc Wristbands
	elsif (plugin::takeItems(12223 => 2)) {
		quest::say("Fine work hunter!  As your reward please accept this item which I have fashioned for you.");
		#:: Give a random item: 2034 - Large Leather Gloves, 2171 - Large Raw-hide Leggings, 2164 - Large Raw-hide Tunic
		quest::summonitem(quest::ChooseRandom(2034, 2171, 2164));
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(328, 10); 	#:: + Merchants of Halas
		quest::faction(320, 7);		#:: + Wolves of the North
		quest::faction(327, 7);		#:: + Shamen of Justice
		quest::faction(305, -5);	#:: + Rogues of the White Rose
		#:: Grant a small amount of experience
		quest::exp(100);
		#:: Create a hash for storing cash - 90 to 110cp
		my %cash = plugin::RandomCash(90,110);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
