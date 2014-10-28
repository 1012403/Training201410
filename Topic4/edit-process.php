
<?php
	require_once('functions.inc');

	if (!isset($_POST['submit'])) {

		die(header("Location: editprofile.php"));
	}
	$_SESSION['formAttempt'] = true;
	if (isset($_SESSION['error'])) {
		unset($_SESSION['error']);
	}
	$_SESSION['error'] = array();
	$required = array("lname","fname","password1","password2");

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
	

	if ($_POST['password1'] != $_POST['password2']) {
		$_SESSION['error'][] = "Passwords don’t match";
	}

	if (count($_SESSION['error']) > 0) {

		die(header("Location: editprofile.php"));
	} else {
		if(editUser($_POST)) {
			
		unset($_SESSION['formAttempt']);
		die(header("Location: success.php"));
		} else {

			
			error_log("Problem registering user: {$_POST['email']}");
			$_SESSION['error'][] = "Problem registering account";
			die(header("Location: editprofile.php"));
		}
	}

	function editUser($userData){
		
	
		$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);

		if ($mysqli->connect_errno){
			error_log("Cannot connect to sql " . $mysqli->connect_error);
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
		$user = new User();
		$userID = $mysqli->real_escape_string($user->id);

		$query = "UPDATE User set fname = '{$fname}',lname = '{$lname}', password = '{$password}', address = '{$address}', dob = '{$dob}' where UserID = '{$userID}'";
        if ($mysqli->query($query)) {
        	
		//	$id = $mysqli->insert_id;
			error_log("Edit success");
			return true;
		} else {
		
			error_log("Problem editting ");
			return false;
		}

	}


?>