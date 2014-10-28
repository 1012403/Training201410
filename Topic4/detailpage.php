<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap-theme.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>	
		<script type="text/javascript" src="javascript/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.2.0-dist/js/bootstrap.js"></script>
	
		<title>Detail post</title>
	</head>
	<body>
			<div>
						<?php
							require_once('functions.inc');
							$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
								if ($mysqli->connect_errno){
									error_log("Cannot connect to sql " . $mysqli->connect_error);
									return false;
							}
							$postID = $_GET['var'];

							$query = "SELECT P.PostTitle, P.Content, P.PostedDay, U.Email from post P, user U where P.PostID = $postID";
							$findResult = $mysqli->query($query);
							if ($findpost = $findResult->fetch_assoc()){
								echo "<div class=\"posts panel panel-default\">";
									
									echo "<div class=\"panel-heading\">".$findpost['PostTitle']."</div>";
									echo "<div class=\"panel-body\">";
										
										echo "<div class=\"content expandable\">";
											echo "<p class=\"postcontent\">".$findpost['Content']."</p>";
										echo "</div>";
										echo "<div class=\"ListComment expandable\">";
									
											$postID = $mysqli->real_escape_string($postID);
											$query1 = "SELECT C.CmtID, C.Content, C.CmtDay, C.PostID, U.Email from comment C join user U on C.UserID = U.UserID where C.PostID = $postID ORDER BY C.CmtID ASC";
											$result = $mysqli->query($query1);
									
											while ($findcomment = $result->fetch_assoc()){
												echo "<div class=\"comment\">";
												
														echo "<a href=\"\">".$findcomment['Email'].": </a>";
														echo $findcomment['Content'];
												
													
												echo "</div>";
											}
									
											echo "<input type=\"text\" placeholder=\"Write a comment...\" class=\"writeCmt\" id=\"$postID\">";
										
										echo "</div>";
									echo "</div>";
								echo "</div>";

							}

							$query1 = "UPDATE post SET View = View + 1 WHERE PostID = $postID";
						$mysqli->query($query1);
						
						?>
		
			</div>
	</body>
</html>