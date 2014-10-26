<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap-theme.css">
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
				      				<li><a id="Trangchu"  href="#">Hompage</a></li>
									<li><a  href="#">Wallpage</a></li>
									<li><a  href="logout.php">Logout</a></li>
									
				     			</ul>
				    		</div><!-- /.navbar-collapse -->
	  					</div><!-- /.container-fluid -->
					</nav>
				</div>
			</div>
		</div>
		
		<div id="content">
			<div class="PostStatus">
				<form role="form">
					<div class="form-group">
						<label>Title post</label>
						<input id="title" class="form-control">
						<label>Content</label>
						<textarea  id="message" class="form-control" rows="4" cols="50" type="text" minlength="50" maxlength="1000" placeholder="What's on your mind?"></textarea>	
					</div>	
				</form>			
				<button class="btn btn-primary" type="button" id="postBtn">POST</button>	
			</div>
			<div id="Listpost">
				<?php
					include 'shownewpost.php';
				?>
				
			</div>
			
		</div>

	</body>
</html>