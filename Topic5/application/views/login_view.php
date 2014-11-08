<!doctype>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/bootstrap-3.2.0-dist/css/bootstrap-theme.css">		
		<script type="text/javascript" src="/bootstrap-3.2.0-dist/js/bootstrap.js"></script>
	</head>
	<body>
		<?php
			echo validation_errors();
			echo form_open('login');
			echo form_fieldset('Login:');
			echo form_label('Username:');
			$email = array(
				'name' => 'email',
				'id' => 'email',
				'class'=>'form-control',
				'value' => '');
			echo form_input($email);
			echo form_label('Password');
			$password = array(
				'name' =>'password',
				'id' => 'password',
				'class' => 'form-control',
				'value'=>'');
			echo form_password($password);
			$submit = array(
				'name' =>'submit',
				'id' =>'submit',
				'value'=>'Login');
			echo form_submit($submit);
			echo "<a href=\"register\">Register</a>";
			echo "<a href=\"register/resetpass\"> Forget password</a>";
		?>
	</body>
</html>
