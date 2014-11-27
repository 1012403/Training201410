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
					<li><a href="register">Đăng kí</a></li>
				</ul>
			</div>
		</div>
		
		<div class="content login well well-lg col-md-offset-3">	
			<form id="register" action="" method="post">
				<fieldset>
					<legend>Login</legend>
					<?php echo form_open('login/index'); ?>
					<div class="input-group">
						<h3>Nhập tên tài khoản:</h3>
						<?php 
							if(isset($errors) && in_array('username', $errors))
								echo "<p class=\"warning\">Xin vui lòng nhập tên tài khoản!</p>";
						?>
						<?php 
							$dt1 = array(
				              'name'        => 'username',
				              'class'          => 'form-control',
				              'placeholder'   => 'username',
				            );
							echo form_input($dt1);
						?>
				  		<!--<input type="text" name="username" class="form-control" placeholder="username" value="<?php if(isset($_POST['username'])) echo $_POST['username']; ?>">-->
					</div>

					<div class="input-group">
						<h3>Mật khẩu: </h3>
						<?php 
							if(isset($errors) && in_array('password', $errors))
								echo "<p class=\"warning\">Xin vui lòng nhập mật khẩu!</p>";
						?>
						<?php 
							$dt2 = array(
				              'name'        => 'password',
				              'class'          => 'form-control',
				              'placeholder'   => 'password',
				            );
							echo form_password($dt2);
						?>
					  	<!--<input type="password" name="password" class="form-control" placeholder="password">-->
					</div>
					<?php
						$dt3 = array(
					    'class' => 'btn btn-default',
					    'type' => 'submit',
					    'content' => 'Đăng nhập'
						);
						echo form_button($dt3);
					?>
					<!--<button type="submit" class="btn btn-default">Đăng nhập</button>-->
					<?php echo form_close(); ?>
				</fieldset>
			</form>
		</div>
		
	</div>
</body>