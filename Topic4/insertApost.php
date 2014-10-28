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
				error_log("Insert success");

			//	return array('post'=>$findpost, 'success' => 'ok');
			$query1 = "SELECT MAX(PostID) as ID from post";
			$result = $mysqli->query($query1);
			$findid = $result->fetch_assoc();
			$id = $findid['ID'];
			$userID = $user->id;

		echo "<div class=\"posts panel panel-default\">";
			echo "<div class=\"panel-heading\">"."<a href =\"userpage.php?varId=$userID\" class=\"emailName\">".$user->email."</a>"."</div>";
			echo "<div class=\"panel-body\">";
				echo "<div class=\"postTitle\">Titile:"."<a href=\"detailpage.php?var=$id\">".$titlePost."</a>"."</div>";
					echo "<div class=\" content expandable\">";
						echo "<p class=\"postcontent\">".$contentPost."</p>";
					echo "</div>";
				echo "<input type=\"text\" placeholder=\"Write a comment...\" class=\"writeCmt\" id=\"$id\">";
			
			echo "</div>";
		echo "</div>";
				
	
		} else {
			
			error_log("Problem inserting ");
				
			}
		}

			
?>
/*
<?php


?>
*/