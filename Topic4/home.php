<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap-theme.css">
		<link rel="stylesheet" type="text/css" href="style/home.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>	
		<script type="text/javascript" src="javascript/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.2.0-dist/js/bootstrap.js"></script>
		<script type="text/javascript" src="javascript/home.js"></script>	
		<script type="text/javascript" src="javascript/jquery.expander.js"></script>
		<title>HOME PAGE</title>
	</head>
	<body>
		<div id="header">
			<div class="container">
				<div class="row">
					<img src="" alt="">
				</div>
				<div class="row">
					<nav class="navbar navbar-default" role="navigation">
	 				    <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
			   				 <div class="navbar-header">
			      				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu">
			       			 		<span class="sr-only">Toggle navigation</span>
			       					<span class="icon-bar"></span>
			        				<span class="icon-bar"></span>
			        				<span class="icon-bar"></span>
			      				</button>
			    			</div>

	    <!-- Collect the nav links, forms, and other content for toggling -->
				    		<div class="collapse navbar-collapse" id="menu">
				     			<ul class="nav navbar-nav navbar-right">
				     				<?php
				     				require_once('functions.inc');
				     					echo "<li><a id=\"Trangchu\"  href=\"home.php\">Hompage</a></li>";
				     					$user = new User();
				     					$userID = $user->id;
				     					echo "<li><a  href=\"userpage.php?varId=$userID\">Wallpage</a></li>";
				     					echo "<li><a  href=\"logout.php\">Logout</a></li>";
				     				?>
				      			
				     			</ul>
				    		</div><!-- /.navbar-collapse -->
	  					</div><!-- /.container-fluid -->
					</nav>
				</div>
			</div>
		</div>
		
		<div id="content">
			<div class="PostStatus">
				<label>Title post</label>
				<input id="title" class="form-control">
				<label>Content</label>
				<textarea  id="message" class="form-control" rows="4" cols="50" type="text" minlength="50" maxlength="1000" placeholder="What's on your mind?"></textarea>	
				<button class="btn btn-primary" type="button" id="postBtn">POST</button>	
			</div>
				<?php
					
					$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
						if ($mysqli->connect_errno){
							error_log("Cannot connect to sql " . $mysqli->connect_error);
							return false;
					}

					$query = "SELECT P.PostID, P.PostTitle, P.Content, P.PostedDay, P.View, U.Email, U.UserID from post P join user U on P.GivenUser = U.UserID where P.GivenUser = U.UserID ORDER BY P.PostID DESC";
					$findResult = $mysqli->query($query);
					while ($findpost = $findResult->fetch_assoc()){
						echo "<div class=\"posts panel panel-default\">";
							$id = $findpost['PostID'];
							$view = $findpost['View'];
							$userID = $findpost['UserID'];
							echo "<div class=\"panel-heading\">"."<a href=\"userpage.php?varId=$userID\" class=\"emailName\">".$findpost['Email']."</a>"."</div>";
							echo "<div class=\"panel-body\">";
								echo "<div class=\"postTitle\">Titile:"."<a href=\"detailpage.php?var=$id\">".$findpost['PostTitle']." - </a>".$view." views."."</div>";
								echo "<div class=\"content expandable\">";
									echo "<p class=\"postcontent\">".$findpost['Content']."</p>";
								echo "</div>";
								echo "<div class=\"ListComment expandable\">";
							
									$postID = $mysqli->real_escape_string($findpost['PostID']);
									$query1 = "SELECT C.CmtID, C.Content, C.CmtDay, C.PostID, U.Email, U.UserID from comment C join user U on C.UserID = U.UserID where C.PostID = '{$postID}' ORDER BY C.CmtID ASC";
									$result = $mysqli->query($query1);
									
									while ($findcomment = $result->fetch_assoc()){
										echo "<div class=\"comment\">";
												$userIDCmt = $findcomment['UserID'];	
												echo "<a href=\"userpage.php?varId=$userIDCmt\">".$findcomment['Email'].": </a>";
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

	</body>
</html>