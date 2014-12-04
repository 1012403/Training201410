<!doctype>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/Style/style.css">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/bootstrap-3.2.0-dist/css/bootstrap-theme.css">		
		<script type="text/javascript" src='<?php echo base_url();?>/javascript/jquery-1.8.3.min.js'></script>
		<script type="text/javascript" src="<?php echo base_url();?>/bootstrap-3.2.0-dist/js/bootstrap.js"></script>
		<script type="text/javascript" src="<?php echo base_url();?>/javascript/knockout-3.2.0.js"></script>
		<script type="text/javascript" src="<?php echo base_url();?>/javascript/myscript2.js"></script>
	</head>
	<body>
		<h2>Titile: <?php echo $title ?></h2>
		<h2>Content</h2>
		<div class="panel panel-default">
			<div class="panel-heading">
				<?php echo $content ?>				
			</div>
			<div class="panel-body">
				<div data-bind="template:{ name: templateComment, foreach: Comments}">
			
				</div>	
				<input class="cmtBox" type="text" data-bind="value: CmtContent, valueUpdate: 'afterkeydown', event: { keypress: $root.CmtEvent}">
			</div>
			
		</div>
		
	

		<script type="text/javascript">
			var dataSource = {};
			dataSource.ListComment = JSON.parse('<?php echo json_encode($listComment); ?>');
			var IdAdmin = "<?php echo $this->my_auth->__get('userid'); ?>";
			var insertCmt = '<?php echo base_url()?>' + 'index.php/post/insertCommentToPost';
			var editCmt = '<?php echo base_url()?>' + 'index.php/post/editComment';
			var PostID = '<?php echo $postID?>';
			var GivenUser = '<?php echo $givenUser?>';
			var dellCmt = '<?php echo base_url()?>' + 'index.php/post/dellComment';
		</script>

		<script type="text/html" id="viewCmtTmpl">
						<div class="row">
							<div class="col-md-2" data-bind="text: Content"></div>
							<span  class="dellCmt  glyphicon glyphicon-remove" aria-hidden="true" data-bind="click: $root.delCmt"></span>
							<span  class="editCmt 	glyphicon glyphicon-edit" aria-hidden="true" data-bind="click: $root.editCmt"></span>
						</div>
		</script>

		<script type="text/html" id="editCmtTmpl">
			<div class="row">
				<input class="col-md-push-1 editCmtBox" type="text" data-bind="value:Content, valueUpdate:'afterkeydown',event:{keypress:$parent.CmtEditEnter}">
				
			</div>
		</script>
	</body>
</html>