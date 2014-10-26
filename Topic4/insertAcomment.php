<?php
require_once('functions.inc');
	$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
	if ($mysqli->connect_errno){
			error_log("Cannot connect to sql " . $mysqli->connect_error);
			return false;
	}

	$user = new User;
		if ($user->isLoggedIn == true){
			$id = $mysqli->real_escape_string($user->id);

			$contentPost = $mysqli->real_escape_string($_POST['message']);
			$postid = $mysqli->real_escape_string($_POST['id']);
			
			$query = "INSERT INTO comment (Content,CmtDay,PostID,UserID) VALUES ('{$contentPost}',NOW(), $postid, $id)";
			 if ($mysqli->query($query)) {
	        	
					error_log("Insert success");
					return true;
				} else {
				
					error_log("Problem inserting ");
					return false;
				}
			}
?>
