<?php include('includes/header.php') ?>
<?php include('includes/mysql_connect.php') ?>
<?php include('includes/functions.php') ?>
		<div class="content login well well-lg col-md-offset-3">
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
					
					if(empty($errors))
					{
						// kiểm tra email, username
						$query = "SELECT user_id, username FROM users WHERE (username ='{$username}' AND password = SHA1('$password')) AND active IS NULL LIMIT 1";
						$r = mysql_query($query);
						
						if(mysql_num_rows($r) == 1)
						{
							list($user_id,$username) = mysql_fetch_array($r,MYSQL_NUM);
							$_SESSION['user_id'] = $user_id;
							$_SESSION['username'] = $username;
							redirect_to();
						}
						else
						{
							echo "<p class=\"warning\">Tên tài khoản hoặc mật khẩu không hợp lệ!</p>";
						}
					}					
				}
			?>
			<form id="register" action="" method="post">
				<fieldset>
					<legend>Login</legend>
					<div class="input-group">
						<h3>Nhập tên tài khoản:</h3>
						<?php 
							if(isset($errors) && in_array('username', $errors))
								echo "<p class=\"warning\">Xin vui lòng nhập tên tài khoản!</p>";
						?>
				  		<input type="text" name="username" class="form-control" placeholder="username" value="<?php if(isset($_POST['username'])) echo $_POST['username']; ?>">
					</div>

					<div class="input-group">
						<h3>Mật khẩu: </h3>
						<?php 
							if(isset($errors) && in_array('password', $errors))
								echo "<p class=\"warning\">Xin vui lòng nhập mật khẩu!</p>";
						?>
					  	<input type="password" name="password" class="form-control" placeholder="password">
					</div>
					<button type="submit" class="btn btn-default">Đăng nhập</button>
				</fieldset>
			</form>
		</div>
	</div>
</body>