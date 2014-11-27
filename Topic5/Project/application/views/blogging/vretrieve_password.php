<!DOCTYPE html>
<?php include("head.php"); ?>
<body>
	<?php
		if($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			// kiểm tra hợp lệ
			$errors = array();
			
			if(empty($_POST['email']))
				$errors[] = "email";
			else
				$email = $_POST['email'];
		}
	?>
	<div class="wrapper">
		<div class="header row container">
			<div class="logo col-md-2 col-md-offset-1">
				<b><span>FA</span>book</b>
			</div>
			<div class="menu col-md-4 ">
				
			</div>
		</div>
		
		<div class="content login well well-lg col-md-offset-3">	
			<form id="register" action="" method="post">
				<?php echo $message; ?>
				<fieldset>
					<legend>Quên mật khẩu</legend>
					
					<div class="input-group">
						<h4>Email:</h4>
						<?php 
							if(isset($errors) && in_array('email', $errors))
								echo "<p class=\"warning\">Xin vui lòng nhập email!</p>";
						?>
				  		<input type="text" name="email" class="form-control" placeholder="email" value="<?php if(isset($_POST['email'])) echo $_POST['email']; ?>">
					</div>
					<button type="submit" class="btn btn-default">Reset mật khẩu</button>
				</fieldset>
			</form>
		</div>
		
	</div>
</body>