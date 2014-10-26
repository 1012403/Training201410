<?php
	require_once('functions.inc');
	$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
		if ($mysqli->connect_errno){
			error_log("Cannot connect to sql " . $mysqli->connect_error);
			return false;
		}
		$postID = $mysqli->real_escape_string($_SESSION['varID']);
		$query = "SELECT C.CmtID, C.Content, C.CmtDay, C.PostID, U.Email from comment C join user U on C.UserID = U.UserID where C.PostID = '{$postID}' ORDER BY C.CmtID ASC";
		$result = $mysqli->query($query);
		while ($findrow = $result->fetch_assoc()){
				echo "<p class=\"postComment\">".$findrow['Email'].":";
					echo "<span>".$findrow['Content']."</span>";
				echo "</p>";
		}
		echo "<br>";
?>