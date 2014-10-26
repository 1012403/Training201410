
<?php
	require_once('functions.inc');

	if (!isset($_POST['submit'])) {

		die(header("Location: register.php"));
	}
	$_SESSION['formAttempt'] = true;
	if (isset($_SESSION['error'])) {
		unset($_SESSION['error']);
	}
	$_SESSION['error'] = array();
	$required = array("lname","fname","email","password1","password2");

	foreach ($required as $requiredField) {
		if (!isset($_POST[$requiredField]) || $_POST[$requiredField] == "") {
			$_SESSION['error'][] = $requiredField . " is required.";
		}
	}

	if (!preg_match('/^[\w .]+$/',$_POST['fname'])) {
		$_SESSION['error'][] = "First Name must be letters and numbers only.";
	}
	if (!preg_match('/^[\w .]+$/',$_POST['lname'])) {
		$_SESSION['error'][] = "Last Name must be letters and numbers only.";
	}
	
	if (!filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)) {
		$_SESSION['error'][] = "Invalid e-mail address";
		
	}
	if ($_POST['password1'] != $_POST['password2']) {
		$_SESSION['error'][] = "Passwords don’t match";
	}

	if (count($_SESSION['error']) > 0) {

		die(header("Location: register.php"));
	} else {
		if(registerUser($_POST)) {
			
		unset($_SESSION['formAttempt']);
		die(header("Location: success.php"));
		} else {

			
			error_log("Problem registering user: {$_POST['email']}");
			$_SESSION['error'][] = "Problem registering account";
			die(header("Location: register.php"));
		}
	}

	function registerUser($userData){
		
	
		$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);

		if ($mysqli->connect_errno){
			error_log("Cannot connect to sql " . $mysqli->connect_error);
			return false;
		}
		$email = $mysqli->real_escape_string($_POST['email']);
		$findUser = "SELECT UserID from User where email = '{$email}'";
		$findResult = $mysqli->query($findUser);
		$findRow = $findResult->fetch_assoc();
		if (isset($findRow['UserID']) && $findRow['UserID'] != "") {
			$_SESSION['error'][] = "A user with that e-mail address already exists";
			return false;
		}

		$lname = $mysqli->real_escape_string($_POST['lname']);
		$fname = $mysqli->real_escape_string($_POST['fname']);
		$cryptedPassword = crypt($_POST['password1']);
		$password = $mysqli->real_escape_string($cryptedPassword);

		if (isset($_POST['address'])) {
			$address = $mysqli->real_escape_string($_POST['address']);
		} else {
			$address = "";
		}

		if (isset($_POST['dob'])) {
			$dob = $mysqli->real_escape_string($_POST['dob']);
		} else {
			$dob = "";
		}

		$query = "INSERT INTO User (fname,lname,password,address,dob,email) VALUES ('{$fname}', '{$lname}', '{$password}', '{$address}', '{$dob}', '{$email}')";
        if ($mysqli->query($query)) {
        	
		//	$id = $mysqli->insert_id;
			error_log("Insert success");
			return true;
		} else {
		
			error_log("Problem inserting ");
			return false;
		}

	}


?>