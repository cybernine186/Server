sub EVENT_ENTERZONE {
	if ($status < 80) {
		$client->BuffFadeAll();
	}
}
