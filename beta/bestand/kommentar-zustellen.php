<?php

// commentsubmit.php -- Receive comments and e-mail them to someone
// Copyright (C) 2011 Matt Palmer <mpalmer@hezmatt.org>
//
// Format of the date you want to use in your comments.
// http://php.net/manual/en/function.date.php for details
$DATE_FORMAT = "j.n.Y, G:i";

// Where the comment e-mails should be sent to.
$EMAIL_ADDRESS = "postfach2b@web.de";

// The subject of all blog comment e-mails.
$SUBJECT = "@cz+ Neuer Kommentar";

// The contents of the following file (relative to this PHP file) will be
// displayed after the comment is received.  Customise it to your heart's
// content.
$COMMENT_RECEIVED = "kommentar-abgeschickt.html";

/***********************************************************************
 * HERE BE CODE
***********************************************************************/

$post_id = $_POST["post_id"];
unset($_POST["post_id"]);
$msg = "post_id: $post_id\n";
$msg .= "date: " . date($DATE_FORMAT) . " Uhr\n";

foreach ($_POST as $key => $value) {
	if (strstr($value, "\n") != "") {
		// Value has newlines... need to indent them so the YAML
		// looks right
		$value = str_replace("\n", "\n  ", $value);
	}
	// It's easier just to single-quote everything than to try and work
	// out what might need quoting
	$value = "'" . str_replace("'", "''", $value) . "'";
	$msg .= "$key: $value\n";
}

if (mail($EMAIL_ADDRESS, $SUBJECT, $msg, "From: $EMAIL_ADDRESS"))
{
	include $COMMENT_RECEIVED;
}
else
{
	echo "Der Kommentar konnte nicht abgeschickt werden. Falls dieser Fehler mehrmals auftritt, bitte eine kurze Nachricht an postfach2b@web.de.";
}
