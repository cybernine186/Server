sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail $name. I train those young gnomes who wish to [serve as a warrior] in the service of the Dark Reflection and our patron. Bertoxxulous the Plaguelord. Decay and destruction are powerful forces that influence Norrath. It is the duty of the Warriors of the Dark Reflection to bring destruction to the weak and injury to the strong so that our fellow gnomes may be reminded of their own mortality and new strong individuals may rise to power before Bertoxxulous decides it is their time to decay and be replaced like countless before them.");
}


sub EVENT_ITEM {
 #do all other handins first with plugin, then let it do disciplines
 
 plugin::return_items(\%itemcount);
}
#END of FILE Zone:akanon  ID:55157 -- Naygog_Mitope 
