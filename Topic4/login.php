
<?php
require_once("functions.inc");
$user = new User;
$user->logout();
?>


<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap-theme.css">		
		<link rel="stylesheet" type="text/css" href="style/registerstyle.css">
		<script type="text/javascript" src="javascript/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.2.0-dist/js/bootstrap.js"></script>
		<script type="text/javascript" src="javascript/login.js"></script>
		<title>Login page</title>
	</head>
	<body>
		<form id="loginForm" method = "POST" action="login-process.php">
			<div>
				<fieldset>
					<legend>Login</legend>
					<div id="errorDiv">
						<?php
							if (isset($_SESSION['error']) && isset($_SESSION['formAttempt'])){
								unset($_SESSION['formAttempt']);
								print "Errors encountered <br>";
								foreach($_SESSION['error'] as $error){
									print $error . "<br>";
								}
							}
						?>
					</div>
					<div class="input-group">
						<label for="email">Email address:*</label>
						<input type="text" id="email" class="form-control" name="email">
						<span class="errorFeedback errorSpan" id="emailError">E-mail is required</span>	
					</div>

					<div class="input-group">
						<label for="password">Password:*</label>
						<input type="password" id="password" class="form-control" name="password">
						<span class="errorFeedback errorSpan" id="passwordError">Password required</span>
					</div>
					<input type="submit" id="submit" name="submit" value="Login">

				</fieldset>
			</div>

		</form>
		<a href="password-recovery.php">Forget password</a>
	</body>
</html>