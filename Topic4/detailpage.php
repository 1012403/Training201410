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
							echo "<span class=\"label label-primary\">".$_POST['Title']."</span>";
							echo "<span class=\"label label-primary\">"."Detail"."</span>";
							echo "<div class=\"posts well\">";
							echo $_POST['Content'];
							echo "</div>";

						?>
		
			</div>
	</body>
</html>