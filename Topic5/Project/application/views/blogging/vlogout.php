<!DOCTYPE html>
<?php include("head.php"); ?>
<body>
	<?php
		if($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			// kiểm tra hợp lệ
			$errors = array();
			if(empty($_POST['username']))
				$errors[] = "username";
			else
				$username = $_POST['username'];					
			if(empty($_POST['password']))
				$errors[] = "password";
			else
				$password = $_POST['password'];
			
		}
	?>
	<div class="wrapper">
		<div class="header row container">
			<div class="logo col-md-2 col-md-offset-1">
				<b><span>FA</span>book</b>
			</div>
			<div class="menu col-md-4 ">
				<ul class="nav nav-pills">
					<li><a href="login">Đăng nhập</a></li>					
					<li><a href="register">Đăng kí</a></li>
			  	</ul>
			</div>
		</div>
		
		<div class="content login well well-lg col-md-offset-3">	
			<form id="register" action="" method="post">
				<fieldset>
					<legend>Đăng xuất</legend>
					<h3><?php echo $message?></h3>
				</fieldset>
			</form>
		</div>
		
	</div>
</body>