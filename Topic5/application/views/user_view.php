<!doctype>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/bootstrap-3.2.0-dist/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/bootstrap-3.2.0-dist/css/bootstrap-theme.css">		
		<script type="text/javascript" src='<?php echo base_url();?>/javascript/jquery-1.8.3.min.js'></script>
		<script type="text/javascript" src="<?php echo base_url();?>/bootstrap-3.2.0-dist/js/bootstrap.js"></script>
		<script type="text/javascript" src="<?php echo base_url();?>/javascript/knockout-3.2.0.js"></script>
		<script type="text/javascript" src="<?php echo base_url();?>/javascript/myscript.js"></script>
	</head>
	<body>
		<div id="header">
			<div class="container">
				<div class="row">
					<nav class="navbar navbar-default" role="navigation">
						<div class="container">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu">
									<span class="sr-only">Toggle navigation</span>
			       					<span class="icon-bar"></span>
			        				<span class="icon-bar"></span>
			        				<span class="icon-bar"></span>
								</button>
							</div>
							<div class="collapse navbar-collapse" id="menu">
								<ul class="nav navbar-nav navbar-right">
									<li><a href="#" id="homePage">Homepage</a></li>
									<li><a href="#" id="userPage">User</a></li>
									<li><a href="#" id="Logout">Logout</a></li>
								</ul>
							</div>
						</div>
					</nav> 	
				</div>
				
			</div>
		</div>

		<div id="container">
			<div class="row">
				<div class="left-panel col-md-4">
					<h2>User information</h2>
					<div class="Name"><?php echo $userName; ?></div>
					<div class="Email"><?php echo $userEmail; ?></div>
				</div>
				<div class="right-panel col-md-8">
					
						<div class="PostStatus">
							<label>Title post</label>
							<input id="title" class="form-control">
							<label>Content</label>
							<textarea  id="message" class="form-control" rows="4" cols="50" type="text" minlength="50" maxlength="1000" placeholder="What's on your mind?"></textarea>	
							<button class="btn btn-primary" type="button" id="postBtn" data-bind="click: addPost">POST</button>	
						</div>
						<div class="Posts">

							<div >
								<div class="panel panel-default" data-bind="template:{ name:templateToUse, foreach: ListPost}">
									
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						var dataSource = {};
						dataSource.ListPost = JSON.parse('<?php echo json_encode($listPost); ?>');
						var urlInsert = '<?php echo base_url()?>' + '/index.php/post/insertAPost';
						var urlDell = '<?php echo base_url()?>' + '/index.php/post/dellAPost';
						var urlEdit = '<?php echo base_url()?>' + '/index.php/post/updatePost';
						var IdAdmin = "<?php echo $this->my_auth->__get('userid'); ?>";
						var UserID = "<?php echo $userId; ?>";
					</script>

					<script type="text/html" id="editTmpl">
						<a href="#" id="finishEdit" data-bind="click: $root.finishEdit">Finish</a>
						<div class="panel-heading">
							<input data-bind="value: PostTitle"/>
						
						</div>
						<div class="panel-body">
							<input  data-bind="value: Content"/>
						</div>
						<br>
					</script>

					<script type="text/html" id="viewTmpl">
						<a href="#" id="dellPost" data-bind="click: $root.dellPost">Delete status</a>
						<a href="#" id="startEdit" data-bind="click: $root.startEdit">Edit</a>
						<div class="panel-heading">
						
							<div data-bind="text: PostTitle"/>
						</div>
						<div class="panel-body" data-bind="text: Content"></div>
						<br>
					</script>	
				</div>	
		</div>
			
			
	</body>
</html>