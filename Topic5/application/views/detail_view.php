<!doctype>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/bootstrap-3.2.0-dist/css/bootstrap-theme.css">		
		<script type="text/javascript" src='<?php echo base_url();?>/javascript/jquery-1.8.3.min.js'></script>
		<script type="text/javascript" src="<?php echo base_url();?>/bootstrap-3.2.0-dist/js/bootstrap.js"></script>
		<script type="text/javascript" src="<?php echo base_url();?>/javascript/knockout-3.2.0.js"></script>
		<script type="text/javascript" src="<?php echo base_url();?>/javascript/myscriptCmt.js"></script>
	</head>
	<body>
		<h2>Titile: "<?php echo $title ?>"</h2>
		<h2>Content</h2>
		<div>"<?php echo $content ?>"</div>	
		<div class="listComment" data-bind="template:{name:templateCmt, foreach:ListCmt}">
			
		</div>	
		<script type="text/html" id="viewCmtTmpl">
			<a href="#" data-bind="click: $root.editCmt" id="editCmt">Edit</a>
			<div data-bind="text: Content"/>

		</script>

		<script type="text/html" id="editCmtTmpl">
			<a href="#" data-bind="click: $root.viewCmt" id="viewCmt">Finish</a>
			<input data-bind="value: Content"/>
		</script>

		<script type="text/javascript">
			var dataSource = {};
			dataSource.ListComment = JSON.parse('<?php echo json_encode($listComment); ?>');
		</script>
	</body>
</html>