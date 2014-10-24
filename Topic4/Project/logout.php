<?php include('includes/header.php') ?>
<?php include('includes/mysql_connect.php') ?>
<?php include('includes/functions.php') ?>
		<div class="content login well well-lg col-md-offset-3">
			<?php 
				if(!isset($_SESSION['user_id']))
				{
					redirect_to();
				}
				else
				{
					$_SESSION = array();
					session_destroy();
					setcookie(session_name(),'',time()-123456);
					echo "<h3>Bạn đã đăng xuất thành công</h3>";
				}
			?>
		</div>
	</div>
</body>