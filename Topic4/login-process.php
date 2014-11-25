<?php
	require_once('functions.inc');
	if (!isset($_POST['submit'])){
		die(header("Location: login.php"));
	}

	$_SESSION['formAttempt'] = true;
	if (isset($_SESSION['error'])){
		unset($_SESSION['error']);
	}
	$_SESSION['error'] = array();
	$required = array("email","password");

	foreach ($required as $requiredField){
		if (!isset($_POST[$requiredField]) || $_POST[$requiredField] == ""){
			$_SESSION['error'][] = $requiredField . "is required";

		}
	}

	if (!filter_var($_POST['email'],FILTER_VALIDATE_EMAIL)){
		$_SESSION['error'][] = "Invalid e-mail address";
	}

	if (count($_SESSION['error']) > 0){
		die(header("Location: login.php"));
	}
	else{
		$user = new User();
		if ($user->authenticate($_POST['email'],$_POST['password'])){
			unset($_SESSION['formAttempt']);
			die(header("Location: home.php"));

		}
		else{
			$_SESSION['error'][] = "There was a problem with your username or password";
			die(header("Location:login.php"));
		}
	}
?>