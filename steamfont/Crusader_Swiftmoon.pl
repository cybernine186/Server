#Crusader_Swiftmoon.pl
#Part of Innoruuk Regent
#Quickie to despawn him after an hour -Kilelen

sub EVENT_DEATH {
	quest::setfaction(304, "-30"); #Soldiers of Tunare
	quest::setfaction(178, "-30"); #King Tearis Thex
	quest::setfaction(413, "-30"); #Faydarks Champions
	quest::emote("is smashed by the Hand of the Gods!");
}

sub EVENT_SPAWN{
	quest::settimer("depop", 3600);
}

sub EVENT_TIMER{
	quest::stoptimer("depop");
	quest::depop();
}