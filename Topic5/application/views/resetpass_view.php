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
			echo form_open('Register/resetpass');
			echo form_fieldset('Reset pass:');
		
			echo form_label('Email');
			$email = array(
				'name' => 'email',
				'id' => 'email',
				'class'=>'form-control',
				'value' => '');
			echo form_input($email);
					
			$submit = array(
				'name' =>'submit',
				'id' =>'submit',
				'value'=>'Reset password');
			echo form_submit($submit);
		?>
	</body>
</html>
