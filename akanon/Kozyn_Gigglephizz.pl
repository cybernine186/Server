sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::emote("bows politely.  'Greetings my friend. Have you come to turn in one of those malfunctioned containers called, [Tinmizer]'s [Fabulous Compactor]? I shall gladly exchange it for a few nice gems.'");
	}
	elsif ($text=~/who is tinmizer/i) {
		quest::emote("chortles with glee. 'Ho, ho, ho!! Oh, my! Tinmizer was a bit of a goof when it came to tinkering. I am from the [T.B.I.] and I was sent to clean up the mess he made. He was tinkering defective containers and selling them. We [exiled] him and destroyed all his containers. Now we hear the scrapman found some and was using them as a reward for deeds. We have warned him.'");
	}
	elsif ($text=~/where is tinmizer/i) {
		quest::emote("shakes his head in sorrow. 'Alas, for tinkering defective merchandise, he was exiled from Ak'Anon. First, the [clockwork dragon] and now the [Fabulous Compactor]. What could be next? No one has seen nor heard of him since. Probably ended up as a feast for the ogres.'");
	}
	elsif ($text=~/t.b.i/i) {
		quest::emote("lowers his voice and leans closer to your ear.  'Ssshhh. This is against regulations, but you look like you could keep a secret. T.B.I. stands for the Tinkerers Bureau of Investigation. We are a clandestine organization reporting directly to King Ak'Anon. We handle all tinkering glitches, if you know what I mean.'");
	}
	elsif ($text=~/fabulous compactor/i) {
		quest::emote("looks sternly at you.  'The compactor is a defective piece of junk. Crafted by the clumsy hands of [Tinmizer]. My work shall be done as soon as I exchange all the compactors for precious gems. We take a loss here, you know!!?'");
	}
	elsif ($text=~/exiled/i) {
		quest::emote("shakes his head in sorrow.  'Alas, for tinkering defective merchandise, he was exiled from Ak'Anon. First, the [clockwork dragon] and now the [Fabulous Compactor]. What could be next? No one has seen nor heard of him since. Probably ended up as a feast for the ogres.'");
	}
	elsif ($text=~/clockwork dragon/i) {
		quest::emote("shakes in fear.  'Oh!! I have seen it. A thousand feet tall and smells of burning oil. It was tinkered by [Tinmizer]. Yep, that's it all righty. Tinkered by the loon. He started out just making a clock, a GIANT ONE!! It was in the form of a wurm. He called it Big Bynn, you know, after his familiar named Bynn. And then... then it escaped. Yeah.. That's it.'");
	}
}

sub EVENT_ITEM {
	#:: Match a 17033 - Tinmizer's Stupendous Contraption
	if (plugin::takeItems(17033 => 1)) {
		#:: Give a 10016 - Lapis Lazuli
		quest::summonitem(10016);
		#:: Ding!
		quest::ding();
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
