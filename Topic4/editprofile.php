<?php require_once("functions.inc"); ?>
<!DOCUTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/css/bootstrap-theme.css">		
		<link rel="stylesheet" type="text/css" href="style/registerstyle.css">
		<script type="text/javascript" src="javascript/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.2.0-dist/js/bootstrap.js"></script>
		<title>Edit</title>
	</head>
	<body>
		<form id="userForm" method="POST" action="edit-process.php">
			<div>
				<fieldset>
					<legend>Edit</legend>
					<div id="errorDiv">
						<?php
							if (isset($_SESSION['error']) && isset($_SESSION['formAttempt'])){
								unset($_SESSION['formAttempt']);
								print "Error encountered <br>\n";
								foreach ($_SESSION['error'] as $error) {
									# code...
									print $error . "<br>\n";

								}
							}
						?>

					</div>
					<div class="input-group">
						<label>First Name:*</label>
						<input type="text" class="form-control" name="fname" id="fname">
						<span class="errorFeedback errorSpan" id="fnameError">First name is require</span>
						<br>
					</div>

					<div class="input-group">
						<label>Last Name:*</label>
						<input type="text" class="form-control" name="lname" id="lname">
						<span class="errorFeedback errorSpan" id="lnameError">Last name is require</span>
						<br>
					</div>

					<div class="input-group">
						<label>Date of birth:*</label>
						<input type="date" class="form-control" name="dob" id="dob">
						<br>
					</div>

				

					<div class="input-group">
						<label>Password:*</label>
						<input type="password" class="form-control" name="password1" id="password1">
						<span class="errorFeedback errorSpan" id="password1Error">Password is required</span>
						<br>
					</div>

					<div class="input-group">
						<label>Verify password:*</label>
						<input type="password" class="form-control" name="password2" id="password2">
						<span class="errorFeedback errorSpan" id="password2Error">Password is not match</span>
						<br>
					</div>

					<div class="input-group">
						<label>Address:</label>
						<input type="text" class="form-control" name="address" id="address">
						
						<br>
					</div>
					
					<input type="submit" id="submit" value="Edit" name="submit">

					
				</fieldset>
			</div>
		</form>
	</body>
</html>