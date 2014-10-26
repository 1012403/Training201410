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
			$titlePost = $mysqli->real_escape_string($_POST['titlePost']);
			$query = "INSERT INTO post (PostTitle,Content,PostedDay,PostUser,GivenUser) VALUES ('{$titlePost}','{$contentPost}', NOW(), $id,$id)";
			 if ($mysqli->query($query)) {
	        	
				//	$id = $mysqli->insert_id;
					error_log("Insert success");
					return true;
				} else {
				
					error_log("Problem inserting ");
					return false;
				}
			}

			
?>