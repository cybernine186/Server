sub Get_Location_By_Zone
{
	my $zone = $_[0];
	my $location = 0;
	
	if($zone eq "citymist"){$location = 0;}
	if($zone eq "sebilis"){$location = 1;}
	if($zone eq "chardok"){$location = 2;}
	if($zone eq "karnor"){$location = 3;}
	if($zone eq "nurga"){$location = 4;}
	if($zone eq "droga"){$location = 5;}
	if($zone eq "veeshan"){$location = 6;}
	if($zone eq "kaesora"){$location = 7;}
	if($zone eq "dalnir"){$location = 8;}
	
	return $location;
}

return 1;

sub EVENT_SPELL_EFFECT_CLIENT
{
	
	##if($location == 0 or $location == 1 or $location == 2 or $location == 3 or $location == 4 or $location == 5 or $location == 6 or $location == 7 or $location == 8 or $location == 107 or $location == 108)
	#{
	#	quest::movepc(94, 3504, -1259, -342, 370); ##Zone: ej
	#}
 	#else
 	#{
 	#	
 	#}
 }