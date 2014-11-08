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
			echo form_open('Register');
			echo form_fieldset('Register user:');
			$att_label = array(
				'class' => 'label label-primary');
			echo form_label('First name:');
			$fname = array(
				'name' => 'fname',
				'id' => 'fname',
				'class'=>'form-control',
				'value' => '');
			echo form_input($fname);
			echo form_label('Last name');
			$lname = array(
				'name' =>'lname',
				'id' =>'lname',
				'class' => 'form-control',
				'value' => '');
			echo form_input($lname);
			echo form_label('Email');
			$email = array(
				'name' => 'email',
				'id' => 'email',
				'class'=>'form-control',
				'value' => '');
			echo form_input($email);
			echo form_label('Password');
			$password1 = array(
				'name' =>'password1',
				'id' => 'password1',
				'class' => 'form-control',
				'value'=>'');
			echo form_password($password1);
			echo form_label('Verify password');
			$password2 = array(
				'name'=> 'password2',
				'id'=>'password2',
				'class'=>'form-control',
				'value'=>'');
			echo form_password($password2);
			echo form_label("Date of birth");
			echo "<input type=\"date\" class=\"form-control\" name=\"dob\" id=\"dob\">";
			echo form_label("Address");
			$address = array(
				'name' =>'address',
				'id' => 'address',
				'class' => 'form-control',
				'value' =>'');
			echo form_input($address);
			$submit = array(
				'name' =>'submit',
				'id' =>'submit',
				'value'=>'Login');
			echo form_submit($submit);
		?>
	</body>
</html>
