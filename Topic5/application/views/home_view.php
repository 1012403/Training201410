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
									<li><a href="<?php echo base_url();?>index.php/post/showPostView" id="homePage">Homepage</a></li>
									<li><a href="<?php echo base_url();?>index.php/post/showPostViewByUser/<?php echo $this->my_auth->__get("userid")?>" id="userPage">User</a></li>
									<li><a href="<?php echo base_url();?>index.php/login/logout" id="Logout">Logout</a></li>
								
								</ul>
							</div>
						</div>
					</nav> 	
				</div>
				
			</div>
		</div>

		<div id="content">
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
			var urlInsert = '<?php echo base_url()?>' + 'index.php/post/insertAPost';
			var urlDell = '<?php echo base_url()?>' + 'index.php/post/dellAPost';
			var urlEdit = '<?php echo base_url()?>' + 'index.php/post/updatePost';
			var baseurl = '<?php echo base_url()?>' + 'index.php/post/showPostViewByUser/';
			var IdAdmin = "<?php echo $this->my_auth->__get('userid'); ?>";
			var UserID = "<?php echo $this->my_auth->__get('userid'); ?>";
			var showCmtUrl = '<?php echo base_url()?>' + 'index.php/post/showCommentByPost';
			var insertCmt = '<?php echo base_url()?>' + 'index.php/post/insertCommentToPost';
			var editCmt = '<?php echo base_url()?>' + 'index.php/post/editComment';
			var viewUrl = '<?php echo base_url()?>' + 'index.php/post/viewPostDetail/';
			var dellCmt = '<?php echo base_url()?>' + 'index.php/post/dellComment';
			var increaseView = '<?php echo base_url()?>' + 'index.php/post/increaseView/';
		</script>

		<script type="text/html" id="viewTmpl">
			<div class="post-item panel-default">
				<a href="#" id="dellPost" data-bind="click: $root.dellPost">Delete status | </a>
				<a href="#" id="startEdit" data-bind="click: $root.startEdit">Edit | </a>
				<a href="#" id="viewDetail" data-bind="click: $root.viewDetail"> Detail | </a>
				<a href="#" id="showCmt" data-bind="click: $root.showCmt"> Show comment </a>
				<div class="panel-heading">
					<a href="#" class="emailClick" data-bind="click: $root.emailClick, text: Email"></a>
					<div class="row">
							<div class="col-md-1" data-bind="text: PostTitle"/>
							<strong class="col-md-1">Views:</strong>
							<div data-bind="text:View"/>
					</div>
				

				</div>
				<div class="panel-body" style="margin-top:-15px;">
					<strong>Content</strong>
					<div data-bind="text: Content"></div>	

					<strong>Comments</strong>			
					<div data-bind="template:{ name: templateComment, foreach: Comments}">
						
					</div>	
					<input class="cmtBox" type="text" data-bind="value: CmtContent, valueUpdate: 'afterkeydown', event: { keypress: $root.CmtEvent}">
				</div>
	
				
			</div>		

		</script>

		<script type="text/html" id="editTmpl">
			<a href="#" id="finishEdit" data-bind="click: $root.finishEdit">Finish</a>
			<div class="panel-default">
				<div class="panel-heading">
					<input data-bind="value: PostTitle"/>
					<a href="#" id="emailClick"  data-bind="click: $root.emailClick, text: Email"></a>
				</div>
				<div class="panel-body">
					<input  data-bind="value: Content"/>				
				</div>
			</div>
			<br>
		</script>

		<script type="text/html" id="viewCmtTmpl">
			<div class="row">
				<div class="col-md-2" data-bind="text: Content"></div>
				<span  class="dellCmt  glyphicon glyphicon-remove" aria-hidden="true" data-bind="click: $parent.delCmt"></span>
				<span  class="editCmt 	glyphicon glyphicon-edit" aria-hidden="true" data-bind="click: $parent.editCmt"></span>
			</div>
		</script>

		<script type="text/html" id="editCmtTmpl">
			<div class="row">
				<input class="col-md-push-1 editCmtBox" type="text" data-bind="value:Content, valueUpdate:'afterkeydown',event:{keypress:$parent.CmtEditEnter}">
				
			</div>
		</script>
	
	</body>
</html>