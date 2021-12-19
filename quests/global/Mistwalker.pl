sub EVENT_SPAWN {
        quest::settimer("depop",10);
}

sub EVENT_TIMER {
        quest::stoptimer("depop");
        quest::depop_withtimer();
}