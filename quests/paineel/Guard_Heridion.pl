sub EVENT_SAY {
  if($text=~/hail/i && $faction <= 5) {
    quest::say("Uggg. You needz [keyz]? Rrrrrrr.");
  }
  if($text=~/key/i && $faction <= 5) {
    quest::say("Uggggg. Take dis keyz.");
    quest::summonitem(6378); # Item: Bone Crafted Key
  }
}

#END of FILE Zone:paineel  ID:75010 -- Guard_Heridion