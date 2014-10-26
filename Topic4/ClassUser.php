<?php
	require_once("functions.inc");
	class User{
		public $id;
		public $email;
		public $fname;
		public $lname;
		public $dob;
		public $password;
		public $address;
		public $isLoggedIn = false;
		public $errorType = "fatal";
	

		function __construct(){
			
			if (session_id() == ""){
				session_start();
			}
			
			if (isset($_SESSION['isLoggedIn']) && $_SESSION['isLoggedIn'] == true){
				$this->_initUser();
			
				
			}
		
			
		}

		public function authenticate($user,$pass){
			
			if (session_id() == "") {
				session_start();
			}
			$_SESSION['isLoggedIn'] = false;
			$this->isLoggedIn = false;
		
			$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
			if ($mysqli->connect_errno){
				error_log("Cannot connect to SQL" . $mysqli->connect_error);
				return false;

			}

			$safeUser = $mysqli->real_escape_string($user);
			$incomingPassword = $mysqli->real_escape_string($pass);
			$query = "SELECT * from User where email = '{$safeUser}'";

			if (!$result = $mysqli->query($query)){


				error_log("Cannot retrieve account for {$user}");
				return false;
			}

			$row = $result->fetch_assoc();
			$dbPassword = $row['Password'];
		
			if (crypt($incomingPassword,$dbPassword) != $dbPassword) {
				
				error_log("Passwords for {$user} don’t match");
				return false;
			}


			$this->id = $row['UserID'];
			$this->email = $row['Email'];
			$this->fname = $row['FName'];
			$this->lname = $row['LName'];
			$this->address = $row['Address'];
			$this->dob = $row['Dob'];
			$this->password = $row['Password'];

			$this->isLoggedIn = true;
			
		
			$this->_setSession();	

			return true;
		}

		private function _setSession(){
			if (session_id() == '') {
				session_start();
			}
			$_SESSION['UserID'] = $this->id;
			$_SESSION['email'] = $this->email;
			$_SESSION['fname'] = $this->fname;
			$_SESSION['lname'] = $this->lname;
			$_SESSION['address'] = $this->address;
			$_SESSION['dob'] = $this->dob;
			$_SESSION['password'] = $this->password;
			$_SESSION['isLoggedIn'] = $this->isLoggedIn;

		
		}

		private function _initUser() {
			if (session_id() == '') {
				session_start();
			}
			$this->id = $_SESSION['UserID'];
			$this->email = $_SESSION['email'];
			$this->fname = $_SESSION['fname'];
			$this->lname = $_SESSION['lname'];
			$this->address = $_SESSION['address'];
			$this->isLoggedIn = $_SESSION['isLoggedIn'];
			$this->dob = $_SESSION['dob'];
			$this->password = $_SESSION['password'];
	
		}

		public function logout(){
			$this->isLoggedIn = false;
			if (session_id() == ""){
				session_start();
			}
			$_SESSION['isLoggedIn'] = false;
			foreach ($_SESSION as $key => $value) {
				# code...
				$_SESSION[$key] = "";
				unset($_SESSION[$key]);
			}

			$_SESSION = array();
			if (ini_get("session.use_cookies")){
				$cookieParameters = session_get_cookie_params();
				setcookie(session_name(),'',time() - 28800,$cookieParameters['path'],$cookieParameters['domain'],$cookieParameters['secure'],$cookieParameters['httponly']);
			}
			session_destroy();
		}

		public function emailPass($user) {
			$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
			if ($mysqli->connect_errno) {
			error_log("Cannot connect to MySQL: " . $mysqli->connect_error);
			return false;
			}

			$safeUser = $mysqli->real_escape_string($user);
			$query = "SELECT UserID,Email FROM User WHERE Email = '{$safeUser}'";
			if (!$result = $mysqli->query($query)) {
			$_SESSION['error'][] = "Unknown Error";
			return false;
			}
			if ($result->num_rows == 0) {
			$_SESSION['error'][] = "User not found";
			return false;
			}
			$row = $result->fetch_assoc();
			$id = $row['UserID'];

			$hash = uniqid("",TRUE);
			$safeHash = $mysqli->real_escape_string($hash);
			$insertQuery = "INSERT INTO resetPassword (email_id,pass_key,date_created,status) " . " VALUES ('{$id}','{$safeHash}',NOW(),'A')";
			if (!$mysqli->query($insertQuery)) {
			error_log("Problem inserting resetPassword row for " . $id);
			$_SESSION['error'][] = "Unknown problem";
			return false;
			}	

			$urlHash = urlencode($hash);
			$site = "http://localhost/Training201410/Topic4";
			$resetPage = "/reset.php";
			$fullURL = $site . $resetPage . "?user=" . $urlHash;
			//set up things related to the e-mail
			$to = $row['email'];
			$subject = "Password Reset for Site";
			$message = "Password reset requested for this site.\r\n\r\n";
			$message .= "Please go to this link to reset your password:\r\n";
			$message .= $fullURL;
			$headers = "From: webmaster@example.com\r\n";
			mail($to,$subject,$message,$headers);
			return true;	
		}


		public function validateReset($formInfo) {
			$pass1 = $formInfo['password1'];
			$pass2 = $formInfo['password2'];
			if ($pass1 != $pass2) {
			$this->errorType = "nonfatal";
			$_SESSION[‘error’][] = "Passwords don’t match";
			return false;
			}
			$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
			if ($mysqli->connect_errno) {
			error_log("Cannot connect to MySQL: " . $mysqli->connect_error);
			return false;
			}

			$decodedHash = urldecode($formInfo['hash']);
			$safeEmail = $mysqli->real_escape_string($formInfo['email']);
			$safeHash = $mysqli->real_escape_string($decodedHash);
			$query = "SELECT c.UserID as id, c.Email as email FROM 
			UserID c, resetPassword r WHERE " .	"r.status = 'A' AND r.pass_key = '{$safeHash}' " . " AND c.email = '{$safeEmail}' " . " AND c.id = r.email_id";
			if (!$result = $mysqli->query($query)) {
			$_SESSION['error'][] = "Unknown Error";
			$this->errorType = "fatal";
			error_log("database error: " . $formInfo['email'] . " - " . $formInfo['hash']);
			return false;
			} else if ($result->num_rows == 0) {
				$_SESSION['error'][] = "Link not active or user not found";
				$this->errorType = "fatal";
				error_log("Link not active: " . $formInfo['email'] . " - " . $formInfo['hash']);
				return false;
				} 
			else {
				$row = $result->fetch_assoc();
				$id = $row['id'];
				if ($this->_resetPass($id,$pass1)) {
				return true;
				} else {
				$this->errorType = "nonfatal";
				$_SESSION['error'][] = "Error resetting password";
				error_log("Error resetting password: " . $id);
				return false;
				}
			}
		}


		private function _resetPass($id,$pass) {
			$mysqli = new mysqli(DBHOST,DBUSER,DBPASS,DB);
			if ($mysqli->connect_errno) {
			error_log("Cannot connect to MySQL: " . $mysqli->connect_error);
			return false;
			}
			$safeUser = $mysqli->real_escape_string($id);
			$newPass = crypt($pass);
			$safePass = $mysqli->real_escape_string($newPass);
			$query = "UPDATE User SET Password = '{$safePass}'" . "WHERE UserID = '{$safeUser}'";
			if (!$mysqli->query($query)) {
			return false;
			} else {
			return true;
			}
		}
	}
			
?>