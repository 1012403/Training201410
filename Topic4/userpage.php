<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap-theme.css">
		<link rel="stylesheet" type="text/css" href="style/userpage.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>	
		<script type="text/javascript" src="javascript/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.2.0-dist/js/bootstrap.js"></script>
		<script type="text/javascript" src="javascript/jquery.expander.js"></script>
		<script type="text/javascript" src="javascript/userpage.js"></script>
		<title>HOME PAGE</title>
	</head>
	<body>

		<div class="container">
			<div class="row">
				<div class="col-md-3 sidebar">
					<?php
						$varID = $_GET['varId'];
						require_once('functions.inc');
						$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
						if ($mysqli->connect_errno){
							error_log("Cannot connect to sql " . $mysqli->connect_error);
							return false;
						}

						$query = "SELECT * from user U where U.UserID = '{$varID}'";
						$result = $mysqli->query($query);
						$finduser = $result->fetch_assoc();
						$userID = $finduser['UserID'];

						echo "<h1>User Info</h1>";
						echo "<h2>".$finduser['FName']." ".$finduser['LName']."</h2>";
						echo "<p>Email: ".$finduser['Email']."</p>";
						echo "<p>Date of birth: ".$finduser['Dob']."</p>";
						echo "<p>Address: ".$finduser['Address']."</p>";
						echo "<div>";
						echo "<a href=\"editprofile.php?UserID=$userID\">Edit profile</a>";
						echo "</div>";
						echo "<div>";
						echo "<a href=\"logout.php\">Log out</a>";
						echo "</div>";

					?>

				</div>
				<div class="col-md-9 content">
					<div class="PostStatus">
						<label>Title post</label>
						<input id="title" class="form-control">
						<label>Content</label>
						<textarea  id="message" class="form-control" rows="4" cols="50" type="text" minlength="50" maxlength="1000" placeholder="What's on your mind?"></textarea>	
						<button class="btn btn-primary" type="button" id="postBtn">POST</button>	
					</div>
				<?php
					require_once('functions.inc');
					$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
						if ($mysqli->connect_errno){
							error_log("Cannot connect to sql " . $mysqli->connect_error);
							return false;
					}

					$query = "SELECT P.PostID, P.PostTitle, P.Content, P.PostedDay, P.View, U.Email, U.UserID from post P join user U on P.GivenUser = U.UserID where P.GivenUser = '{$varID}'";
					$findResult = $mysqli->query($query);
					while ($findpost = $findResult->fetch_assoc()){
						$id = $findpost['PostID'];
						echo "<div class=\"posts panel panel-default\" id=\"panel$id\">";
							
							$view = $findpost['View'];
							$userID = $findpost['UserID'];
							echo "<div class=\"panel-heading\" >"."<a href=\"userpage.php?varId=$userID\" class=\"emailName\">".$findpost['Email']."</a>"."<span class=\"glyphicon glyphicon-remove delCmt\" id=\"$id\">"."</div>";
							echo "<div class=\"panel-body\">";
								echo "<div class=\"postTitle\">Titile:"."<a href=\"detailpage.php?var=$id\">".$findpost['PostTitle']." - </a>".$view." views."."</div>";
								echo "<div class=\"content expandable\">";
									echo "<p class=\"postcontent\">".$findpost['Content']."</p>";
								echo "</div>";
								echo "<div class=\"ListComment expandable\">";
									$postID = $mysqli->real_escape_string($findpost['PostID']);
									$query1 = "SELECT C.CmtID, C.Content, C.CmtDay, C.PostID, U.Email from comment C join user U on C.UserID = U.UserID where C.PostID = '{$postID}' ORDER BY C.CmtID ASC";
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
				?>		
				</div>
			</div>
		</div>
	</body>
</html>