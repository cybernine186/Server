sub EVENT_DISCOVER_ITEM {
	quest::gmsay("$name discovered " . quest::varlink($itemid) . "!", 335, 1, 0, 0);
}

sub EVENT_CLICKDOOR {
    if($status > 200) {
        plugin::Doors_Manipulation_EVENT_CLICKDOOR(); # Door Manipulation Plugin
    }
}
 
sub EVENT_SAY {
    if($status > 200) {
        plugin::Doors_Manipulation_EVENT_SAY(); # Door Manipulation Plugin
    }
}

sub EVENT_ENTERZONE {

	if ($ulevel < 50 && quest::is_content_flag_enabled('n00b_test'))
	{
		quest::level(50);
		quest::scribespells(50);
		quest::traindiscs(50);
	}
}