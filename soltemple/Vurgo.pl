sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Welcome! I am Vurgo, follower of Solusek Ro and holder of the [harvester] and the [Words of Darkness].");
}
if($text=~/what harvester/i){
quest::say("I can forge you one, but you will need to bring me the correct [scythe components].");
}
if($text=~/what scythe components/i){
quest::say("The first thing I need is a shadowed scythe from our mortal enemies, the shadowed men.");
}
if($text=~/what words of darkness/i){
quest::say("I can scribe for you the Words of Darkness, but you will need to bring me the correct [word components].");
}
if($text=~/what word components/i){
quest::say("The first thing that I need is a shadowed book from our mortal enemies, the shadowed men.");
}
}
sub EVENT_ITEM {
  
  # Harvester (1st turn in)
  if($itemcount{5103} == 1) {
  #A shadowed scythe
		quest::summonitem("37635"); #A note
		quest::say("A Shadowed Scythe - well done. The only good Shadowed Man is a banished one. As the weapons of the Shadowed Man have a tendency to disappears, I have given you a note to remind me that you have indeed supplied me with a Scythe. Give me the note with the following items and I will forge you a Harvester: A Fungus Eye from a Mortuary Fungus in the Estate of Unrest, A Shadowed Knife from an Island Goblin Headmaster in the Ocean of Tears and fire opal. Give me these items, and I will forge for you a Harvester.");
		quest::faction("5029","100"); # Temple of Solusek Ro
		quest::faction("416","-100"); # Shadowed Men
		quest::ding();
		quest::exp(50);
	}
  
  # 5316 - Harvester
  if(($itemcount{10538} == 1) && ($itemcount{10031} == 1) && ($itemcount{7331} == 1) && ($itemcount{37635} == 1)) {
  # A Fungus Eye, Fire Opal, Shadowed Knife, A note
		quest::summonitem("5316"); # Harvester
		quest::say("My note, a fungus eye, a shadowed knife and gold! All of the necessary components to make a harvester. Well done, adventurer!");
		quest::faction("5029","100"); # Temple of Solusek Ro
		quest::faction("416","-100"); # Shadowed Men
		quest::ding();
		quest::exp(500);
	}
  
  # Words of Darkness (1st turn in)
  if($itemcount{10529} == 1) {
    # Shadowed Book
    quest::summonitem("37635"); # A note
		quest::say("A shadowed book! Well done! The more banished shadowed men the better. As the items of the shadowed men tend to disappear, I have given you a note to remind me that you have indeed supplied me with a book. Give me the note with the following items, and I will scribe for you Words of Darkness: a book of darkness from the Erudites in the tower by Lake Rathe, a book of frost from the icy goblin in Permafrost Keep and 300 golden coins. Bring me these items, and I will scribe for you the Words of Darkness.")
    quest::faction("5029","100"); # Temple of Solusek Ro
		quest::faction("416","-100"); # Shadowed Men
		quest::ding();
		quest::exp(50);
	}
  
  # 10527 - Words of Darkness 2nd turn in
  if(($itemcount{10536} == 1) && ($itemcount{10537} == 1) && ($itemcount{37635} == 1) && ($gold == 300)) {
    # Book of Darkness, Book of Frost, A note, 300gp
    quest::summonitem("10527"); # Words of Darkness
		quest::say("All of the necessary components for me to scribe the Words of Darkness! Very good, adventurer. Take your tome, you have earned it.' ")
    quest::faction("5029","100"); # Temple of Solusek Ro
		quest::faction("416","-100"); # Shadowed Men
		quest::ding();
		quest::exp(500);
	}
  
	else {
		quest::say("I don't need this.");
		if($item1 > 0){quest::summonitem("$item1");} 
		if($item2 > 0){quest::summonitem("$item2");} 
		if($item3 > 0){quest::summonitem("$item3");} 
		if($item4 > 0){quest::summonitem("$item4");}
		if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {quest::givecash($copper, $silver, $gold, $platinum);}
	}
}

# Words of Darkness ref:
# https://everquest.allakhazam.com/db/quest.html?quest=464
# https://wiki.project1999.com/Words_of_Darkness_Quest

#END of FILE Zone:soltemple  ID:80016 -- Vurgo 
