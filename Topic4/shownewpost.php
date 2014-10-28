<?php
	require_once('functions.inc');
	
	$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
		if ($mysqli->connect_errno){
			error_log("Cannot connect to sql " . $mysqli->connect_error);
			return false;
	}

	$query = "SELECT P.PostID, P.PostTitle, P.Content, P.PostedDay, U.Email from post P, user U where P.GivenUser = U.UserID ORDER BY P.PostID DESC";
	$findResult = $mysqli->query($query);
	while ($findpost = $findResult->fetch_assoc()){
		echo "<div class=\"posts well\">";
		echo "<div class=\"emailName\">User:".$findpost['Email']."</div>";
		echo "<div class=\"postTitle\">Titile:".$findpost['PostTitle']."</div>";
		echo "<div class=\" content expandable\">";
			echo "<p class=\"postcontent\">".$findpost['Content']."</p>";
		echo "</div>";
		echo "<div class=\"ListComment expandable\">";
		
		$postID = $mysqli->real_escape_string($findrow['PostID']);
		$query1 = "SELECT C.CmtID, C.Content, C.CmtDay, C.PostID, U.Email from comment C join user U on C.UserID = U.UserID where C.PostID = '{$postID}' ORDER BY C.CmtID ASC";
		$result = $mysqli->query($query1);
		while ($findcomment = $result->fetch_assoc()){
				echo "<div class=\"postComment\">";
					echo "<div class=\"user\">";
						echo "<a href=\"\">".$findcomment['Email']."</a>";
					echo "</div>";
					echo "<div class=\"cmtContent\">".$findcomment['Content']."</div>";
				echo "</div>";
		}
		echo "<input type=\"text\" placeholder=\"Write a comment...\" class=\"writeCmt\" id=\"$postID\">";
		echo "<br>";

	}

?>