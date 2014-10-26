<?php
	require_once("functions.inc");
	$invalidAccess = true;
	if (isset($_GET['user']) && $_GET['user'] != "") {
		$invalidAccess = false;
		$hash = $_GET['user'];
	}
	//if they’ve attempted the form but had a problem, we need to 	allow them in.
	if (isset($_SESSION['formAttempt']) && $_SESSION['formAttempt']	== true) {
		$invalidAccess = false;
		$hash = $_SESSION['hash'];
	}
	if ($invalidAccess) {
	die(header("Location: login.php"));
}
?>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style/registerstyle.css">
		<title>Reset password</title>
	</head>
	<body>
		<form id="loginForm" method="POST" action="reset-process.php">
			<div>
				<fieldset>
					<legend>Reset Password</legend>
					<div id="errorDiv">
					<?php
						if (isset($_SESSION['error']) && isset($_SESSION['formAttempt'])) {
							unset($_SESSION['formAttempt']);
							print "Errors encountered";
							foreach ($_SESSION['error'] as $error) {
								print $error;
							} //end foreach
						} //end if
					?>
					</div>
					<div class="input-group">
						<label for="email">E-mail Address:* </label>
						<input type="text" id="email" name="email">
						<span class="errorFeedback errorSpan" id="emailError">Email is required</span>
						<br>			
					</div>

					<div class="input-group">
						<label for="password1">Password:* </label>
						<input type="password" id="password1" name="password1">
						<span class="errorFeedback errorSpan" id="password1Error">Password is required</span>
						<br />							
					</div>

					<div class="input-group">
						<label for="password2">Password:* </label>
						<input type="password" id="password2" name="password2">
						<span class="errorFeedback errorSpan" id="password2Error">Passwords don’t match</span>
						<br />					
					</div>
				
				<?php
					print "<input type=\"hidden\" name=\"hash\" value=\"{$hash}\">\n";
				?>
					<input type="submit" id="submit" name="submit">
				</fieldset>
			</div>
		</form>
	</body>
</html>