sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say ("hail, if you would like to boost your level say 'level 10', 'level 20', 'level 30', 'level 40' or 'level 50'! If you require healing or mana simply say heal.");
	}
	if ($text=~/level 50/i) {
		quest::level(50);
		quest::scribespells(50,0);
		quest::givecash(0,0,0,100000);
		quest::setallskill(200);
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->Heal();
	}
	if ($text=~/level 40/i) {
		quest::level(40);
		quest::scribespells(40,0);
		quest::givecash(0,0,0,100000);
		quest::setallskill(200);
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->Heal();
	}
	if ($text=~/level 30/i) {
		quest::level(30);
		quest::scribespells(30,0);
		quest::givecash(0,0,0,100000);
		quest::setallskill(200);
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->Heal();
	}
	if ($text=~/level 20/i) {
		quest::level(20);
		quest::scribespells(20,0);
		quest::givecash(0,0,0,100000);
		quest::setallskill(200);
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->Heal();
	}
	if ($text=~/level 10/i) {
		quest::level(10);
		quest::scribespells(10,0);
		quest::givecash(0,0,0,100000);
		quest::setallskill(200);
		quest::say ("Have fun! Thank you for testing Reign of Thule!");
		$client->Heal();
	}
	if ($text=~/heal/i) {
		$client->Heal();
	}
}
