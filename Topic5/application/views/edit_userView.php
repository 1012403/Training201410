<!doctype>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/bootstrap-3.2.0-dist/css/bootstrap-theme.css">		
		<script type="text/javascript" src="<?php echo base_url();?>/bootstrap-3.2.0-dist/js/bootstrap.js"></script>
	</head>
	<body>
		<?php
			echo validation_errors();

			$stringAddress = "register/editUser/".strval($userInfo['UserID']) ;
	
			echo form_open($stringAddress);
			echo form_fieldset('Edit information:');
			$att_label = array(
				'class' => 'label label-primary');
			echo form_label('First name:');
			$fname = array(
				'name' => 'fname',
				'id' => 'fname',
				'class'=>'form-control',
				'value' => $userInfo['FName']);
			echo form_input($fname);
			echo form_label('Last name');
			$lname = array(
				'name' =>'lname',
				'id' =>'lname',
				'class' => 'form-control',
				'value' => $userInfo['LName']);
			echo form_input($lname);
		
			

			echo form_label('New password: (Optional)');
			$passwordnew = array(
				'name'=> 'passwordnew',
				'id'=>'passwordnew',
				'class'=>'form-control',
				'value'=>'');
			echo form_password($passwordnew);

			echo form_label('Confirm password: (Optional)');
			$passwordconfirm = array(
				'name'=> 'passwordconfirm',
				'id'=>'passwordconfirm',
				'class'=>'form-control',
				'value'=>'');
			echo form_password($passwordconfirm);	

			echo form_label("Date of birth: (YYYY-MM-DD)");
			$date = $userInfo['Dob'];
			echo "<input type=\"date\" class=\"form-control\" name=\"dob\" id=\"dob\" value=\"$date\">";
			echo form_label("Address");
			$address = array(
				'name' =>'address',
				'id' => 'address',
				'class' => 'form-control',
				'value' =>$userInfo['Address']);
			echo form_input($address);

			$submit = array(
				'name' =>'submit',
				'id' =>'submit',
				'value'=>'Ok');
			echo form_submit($submit);
		?>
	</body>
</html>
