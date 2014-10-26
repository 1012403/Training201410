<?php session_start();?>
<!DOCTYPE html>
<head>
	<meta content="text/html"; charset="UTF-8">
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/minejs.js"></script>
	<title> FAbook</title>
</head>
<body>
	<div class="wrapper">
		<div class="header row container">
			<div class="logo col-md-2 col-md-offset-1">
				<b><span>FA</span>book</b>
			</div>
			<div class="menu col-md-4 ">
				<?php if(isset($_SESSION['username'])) 
				{
					echo "<ul class=\"nav nav-pills\">
						<li><a href=\"index.php\">Trang chủ</a></li>
						<li><a id=\"username\" href=\"userpage.php?username=";
					echo $_SESSION['username'];
					echo "\">".$_SESSION['username']."</a></li>
						<li><a href=\"logout.php\">Đăng xuất</a></li>
					  </ul>";
				}
					  else
				echo "<ul class=\"nav nav-pills\">
						<li><a href=\"login.php\">Đăng nhập</a></li>
						<li><a href=\"register.php\">Đăng kí</a></li>
					  </ul>";
					  	?>
			</div>
		</div>