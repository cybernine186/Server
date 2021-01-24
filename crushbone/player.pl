
sub EVENT_CONNECT

{

my $deity = $client->GetDeity();

if($deity > 1)
{
$client->NamePlate(1);
}
}
