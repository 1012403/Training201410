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
			if(empty($_POST['email']))
				$errors[] = "email";
			else
				$email = $_POST['email'];
			if(empty($_POST['password']))
				$errors[] = "password";
			else
				$password = $_POST['password'];
			if(empty($_POST['passwordconfirm']))
				$errors[] = "passwordconfirm";
			if($_POST['password'] != $_POST['passwordconfirm'])
				$errors[] = "dangling";				
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
				</ul>
			</div>
		</div>
		
		<div class="content login well well-lg col-md-offset-3">	
			<form id="register" action="" method="post">
				<?php echo $message; ?>
				<fieldset>
					<legend>Đăng kí tài khoản</legend>
					<div class="input-group">
						<h4>Tên tài khoản:</h4>
						<?php 
							if(isset($errors) && in_array('username', $errors))
								echo "<p class=\"warning\">Xin vui lòng nhập tên tài khoản!</p>";
						?>
				  		<input type="text" name="username" class="form-control" placeholder="username" value="<?php if(isset($_POST['username'])) echo $_POST['username']; ?>">
					</div>
					<div class="input-group">
						<h4>Mật khẩu: </h4>
						<?php 
							if(isset($errors) && in_array('password', $errors))
								echo "<p class=\"warning\">Xin vui lòng nhập mật khẩu!</p>";
						?>
					  	<input type="password" name="password" class="form-control" placeholder="password" value="">
					</div>
					<div class="input-group">
						<h4>Xác nhận lại mật khẩu: </h4>
						<?php 
							if(isset($errors) && in_array('passwordconfirm', $errors))
								echo "<p class=\"warning\">Xin vui lòng nhập mật khẩu xác nhận !</p>";
							else if(isset($errors) && in_array('dangling', $errors))
									echo "<p class=\"warning\">Mật khẩu và mật khẩu xác nhận không giống nhau!</p>";
						?>
					  	<input type="password" name="passwordconfirm"class="form-control" placeholder="comfirm password" value="">
					</div>
					<div class="input-group">
						<h4>Email:</h4>
						<?php 
							if(isset($errors) && in_array('password', $errors))
								echo "<p class=\"warning\">Xin vui lòng nhập email!</p>";
						?>
				  		<input type="text" name="email" class="form-control" placeholder="email" value="<?php if(isset($_POST['email'])) echo $_POST['email']; ?>">
					</div>
					<button type="submit" class="btn btn-default">Tạo tài khoản</button>
				</fieldset>
			</form>
		</div>
		
	</div>
</body>