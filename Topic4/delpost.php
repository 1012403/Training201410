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
		$postID = $mysqli->real_escape_string($_POST['postABC']);
		
		$query = "DELETE FROM comment WHERE PostID = '{$postID}'";
		if ($mysqli->query($query)) {
			$query1 = "DELETE FROM post WHERE PostID = '{$postID}'";
			$mysqli->query($query1);
			return true;
	
		} else {

			return false;
		}
	}

			
?>