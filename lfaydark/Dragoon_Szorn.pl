sub EVENT_SAY{
	if ($text=~/missing shipment/i) {
		quest::say("Our sources in these lands tell us that the previous courier was waylaid by a member of the Fayguard and the crate of valuables taken back to Felwithe. Our source has been working on a plan to recover the crate but we have not received word on her progress in quite some time. Seek Ennixy and tell her 'hate be my guide.' She typically works from her homeland in the Steamfont Mountains.");
	}
}

sub EVENT_ITEM {
	#:: Match a 19030 - Crate of Teir`Dal Provisions
	if (plugin::takeItems(19030 => 1)){
		quest::say("Finally!! We have been in dire need of these supplies for quite some time, Kalaelil! Here is the receipt for the shipment. The last shipment never made it here and there is an item of great importance stored in the lost crate. Before you return to Neriak, your services are needed to retrieve our [missing shipment]. I command your obedience as is my right as a dragoon of Naythox Thex's personal regime.");
		#:: Give a 19029 - Receipt for Provisions Crate
		quest::summonitem(19029);
		#:: Ding!
		quest::ding();
		#:: Create a hash for storing cash - 900 to 1100cp
		my %cash = plugin::RandomCash(900, 1100);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Grant a small amount of experience
		quest::exp(500);
	}
	#:: Match a 19028 - Missing Teir`Dal Crate
	elsif (plugin::takeItems(19028 => 1)){
		quest::say("What is this!! The items of importance have been removed from the crate!! This is most unfortunate. However, you have done well in your service to the Teir'Dal Empire. Take this voucher of services rendered under the command of Naythox Thex back to Ithvol along with the head of that slain Fier'Dal, the receipt for the provisions, and your disciple symbol of Innoruuk.");
		#:: Give a 12499 - Voucher of Service to Naythox
		quest::summonitem(12499);
		#:: Ding!
		quest::ding();
		#:: Create a hash for storing cash - 3900 to 4100cp
		my %cash = plugin::RandomCash(3900, 4100);
		#:: Grant a random cash reward
		quest::givecash($cash{copper},$cash{silver},$cash{gold},$cash{platinum});
		#:: Grant a moderate amount of experience
		quest::exp(1500);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
