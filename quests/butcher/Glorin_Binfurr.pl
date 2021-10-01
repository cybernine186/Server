sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Pleasure to meet you.  Keep your eye out for the [ship].  You don't want to miss it.");
 }
elsif($text=~/ship/i){
quest::emote("looks up dreamily, 'Aye, the good ship SirensBane, did us all a great [service] in her day ...'");
}
elsif($text=~/service/i){
quest::emote("sadly recalls, 'Used to [carry] many adventurer to the Ocean of Tears, even as far as Freeport.'");
}
elsif($text=~/carry/i){
quest::emote("sighs, 'All that's left of her now, is a [ghost] of a memory ....'");
}
elsif($text=~/ghost/i){
quest::say("Walk into the ghost, she might help you get on your way - and don't ever forget the SirensBane ... ");
 }
}
#END of FILE Zone:butcher  ID:68064 -- Glorin_Binfurr 
#Revised AngeloX
#Remember the SirensBane!

