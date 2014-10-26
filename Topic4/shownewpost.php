<?php
	require_once('functions.inc');
	
	$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
		if ($mysqli->connect_errno){
			error_log("Cannot connect to sql " . $mysqli->connect_error);
			return false;
	}

	$query = "SELECT P.PostID, P.PostTitle, P.Content, P.PostedDay, U.Email from post P, user U where P.GivenUser = U.UserID ORDER BY P.PostID DESC";
	$findResult = $mysqli->query($query);
	while ($findrow = $findResult->fetch_assoc()){
		echo "<div class=\"posts well\">";
		echo "<div class=\"emailName\">User:".$findrow['Email']."</div>";
		echo "<div class=\"postTitle\">Titile:".$findrow['PostTitle']."</div>";
		echo "<div class=\" content expandable\">";
			echo "<p class=\"postcontent\">".$findrow['Content']."</p>";
		echo "</div>";
		echo "<div class=\"ListComment expandable\">";
		$_SESSION['varID'] = $findrow['PostID'];
		$postid = $findrow['PostID'];
		include('shownewcomment.php');
		echo "</div>";
		echo "<input type=\"text\" placeholder=\"Write a comment...\" class=\"writeCmt\" id=\"$postID\">";
		echo "</div>";
		echo "<br>";

	}

	function showCommentByPostID($postID){
		$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
		if ($mysqli->connect_errno){
			error_log("Cannot connect to sql " . $mysqli->connect_error);
			return false;
		}
		$query = "SELECT C.CmtID, C.Content, C.CmtDay, C.PostID, U.Email from comment C join user U on C.UserID = U.UserID where C.PostID = '{$postID}' ORDER BY C.CmtID ASC";
		$result = $mysqli->query($query);
		while ($findrow = $result->fetch_assoc()){
			//echo "<div class=\"Comment expandable\">";
				echo "<p class=\"postComment\">".$findrow['Email'].":";
					echo "<span>".$findrow['Content']."</span>";
				echo "</p>";
			//echo "</div>";
		}
		
		echo "<br>";
	}
?>