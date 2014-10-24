<?php include('includes/header.php') ?>
<?php include('includes/mysql_connect.php') ?>
<?php include('includes/functions.php') ?>
		<div class="content register well well-lg col-md-offset-3">		
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

					if(empty($errors))
					{
						// kiểm tra email, username
						$query1 = "SELECT user_id FROM users WHERE username ='{$username}'";
						$r1 = mysql_query($query1);
						$query2 = "SELECT user_id FROM users WHERE email ='{$email}'";
						$r2 = mysql_query($query2);
						if(mysql_num_rows($r1) == 0 && mysql_num_rows($r2) == 0)
						{
							// bắt đầu việc đăng kí
							// tạo mã activate code
							$a = md5(uniqid(rand(),true));
							//chèn vào csdl
							$query = "INSERT INTO users (username,email,password,active,registration_date) VALUES ('{$username}', '{$email}', SHA1('$password'), '{$a}', NOW())";
							$result = mysql_query($query) or die("Query {$query} </br> MySQL Error:" . mysql_error($dbc));
							if(mysql_affected_rows($dbc) == 1)
							{
								$body = "Cảm ơn bạn đã đăng ký tài khoản tại FAbook. 
                        Xin vui lòng click vào đường link bên dưới để kích hoạt tài khoản \n\n ";
                        		$body.= BASE_URL . "/admin/activate.php?x=".urlencode($email)."&y={$a}";
								if(mail_to($_POST['email'],'Kích hoạt tài khoản tại FAbook',$body))
								{
									echo "<p>Tài khoản đăng kí thành công.
									Một email có chứa đường link kích hoạt tài khoản đã gửi tới mail của bạn.
									 Xin vui lòng kiểm tra mail của bạn để kích hoạt tài khoản.</p>";
								}
								else
								{
									echo "<p>Chúng tôi không thể gửi email kích hoạt đến email của bạn. Xin lỗi vì sự bất tiện này. </p>";
								}

								echo "<h4>Tạo tài khoản thành công</h4>";
							}
						}
						else
						{
							if(mysql_num_rows($r1) != 0)
								echo "<p class=\"warning\">Tên tài khoản đã tồn tại!</p>";
							if(mysql_num_rows($r2) != 0)
								echo "<p class=\"warning\">Email đã được sử dụng!</p>";
						}
					}					
				}
			?>

			<form id="register" action="" method="post">
				<fieldset>
					<legend>Register</legend>
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