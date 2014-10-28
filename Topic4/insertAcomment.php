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
	        		$userIdCmt = $user->id;
					error_log("Insert success");
						echo "<div class=\"Comment\">";
							echo "<a href=\"userpage.php?varId=$userIdCmt\">".$user->email.": </a>";
							echo $contentPost;
						echo "</div>";
				} else {
				
					error_log("Problem inserting ");
					return false;
				}
			}
?>
