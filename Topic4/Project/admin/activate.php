<?php include('../includes/header.php') ?>
<?php include('../includes/mysql_connect.php') ?>
<?php include('../includes/functions.php') ?>
	<div class="content activate well well-lg col-md-offset-3">	
		<?php
			if(isset($_GET['x'],$_GET['y']) && filter_var($_GET['x'], FILTER_VALIDATE_EMAIL) && strlen($_GET['y']) == 32)
			{
				$e = mysql_real_escape_string($_GET['x']);
				$a = mysql_real_escape_string($_GET['y']);

				$q = "UPDATE users SET active = NULL WHERE email = '{$e}' AND active = '{$a}' LIMIT 1";
				$r = mysql_query($q);
				if(mysql_affected_rows($dbc) == 1)
				{
					echo "<p>Tài khoản của bạn đã được kích hoạt thành công. Bạn có thể <a href='".BASE_URL."/login.php'>đăng nhập</a> ngay bây giờ.</p>";
				}
				else
				{
					echo "<p class=\"warning\">kích hoạt tài khoản không thành công.</p>";
				}
			}
			else
			{
				redirect_to();
			}
		?>
	</div>
</body>