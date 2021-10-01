

sub EVENT_SAY {
    quest::say("init");
	#use DBD::mysql;
    my $connect = plugin::LoadMysql();
   
    quest::say("stuff");    
    $query = "SELECT id FROM character_data WHERE name = ?;";
    $query_handle = $connect->prepare($query);
    $query_handle->execute("Gangsta");
    while (@row = $query_handle->fetchrow_array()) {
        $charid = $row[0];
        quest::say("result: $charid");
    }
    quest::say("done");
}

