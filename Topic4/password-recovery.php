<?php
require_once("functions.inc");
?>
<!doctype html>
<html>
	<head>
		<script type="text/javascript" src="javascript/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="javascript/email.js"></script>
		<link rel="stylesheet" type="text/css" href="style/registerstyle.css">
		<title>Reset page</title>
	</head>
	<body>
		<form id="emailForm" method="POST" action="email-process.php">
			<div>
				<fieldset>
					<legend>Password recovery</legend>
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
					<label for="email">Email Address:*</label>
					<input type="text" id="email" name="email">
					<span class="errorFeedback errorSpan" id="emailError">Email is required</span>
					<br>
					<input type="submit" id="submit" name="submit" value="Reset password">
				</fieldset>
			</div>
		</form>
	</body>
</html>