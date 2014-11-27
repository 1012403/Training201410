<!DOCTYPE html>
<?php include("head.php"); ?>
<body>
	<div class="wrapper">
		<div class="header row container">
			<div class="logo col-md-2 col-md-offset-1">
				<b><span>FA</span>book</b>
			</div>
			<div class="menu col-md-4 ">
				<ul class="nav nav-pills">
					<li><a href="home">Trang chủ</a></li>
					<?php echo "<li><a id=\"username\" value=\"".$username."\" href=\"userpage/index/".$username."\">".$username."</a></li>";?>
					<li><a href="logout">Đăng xuất</a></li>
			  	</ul>
			</div>
		</div>
		
		<div class="content col-md-offset-3">	
			<div class="post-area" <?php echo ("uid =\"".$user_id."\""); ?> >
				<h4>Cập nhật trạng thái</h4>
				<textarea name="" id="post-content" cols="105" rows="6"></textarea>
				<button type="button" id="poston" class="btn btn-default" data-bind="click: AddPost">Đăng bài</button>
			</div>
			<div data-bind="foreach: posts">
				<div class="posts well well-lg" data-bind="attr: { pid: post_id }">
					<div class="row">
						<div class="userpost col-md-6">
							<a href="" data-bind="attr:{ href: url}"><b data-bind="text: username2"></b></a>
						</div>						
						<div class="icons col-md-1">
							<div class="del-icon" data-bind="click: $root.DeletePost">
								<img src="<?php echo base_url(); ?>images/del_icon.png">
							</div>
							<div class="edit-icon" data-bind="click: $root.EditPost">
								<img src="<?php echo base_url(); ?>images/edit_icon.png">
							</div>
						</div>
						<div class="post-time col-md-3"> <p data-bind="text: post_time"></p></div>	
						<div data-bind="template: { name: $root.templateToUse}">				
							
						</div>
					</div>
				
					<ul class="list-comments" data-bind="foreach: comments">
						<li>
							<div class="comment well well-sm" data-bind="attr: { cid: comment_id }">
								<div class="user-comment">
									<a href="" data-bind="attr:{ href: url}"><b data-bind="text: username"></b></a>
								</div>
								<div class="icons-cm col-md-1">
									<div class="del-icon-cm" data-bind="click: $root.DeleteComment">
										<img src="<?php echo base_url(); ?>images/del_icon.png">
									</div>
									<div class="edit-icon-cm" data-bind="click: $root.EditComment">
										<img src="<?php echo base_url(); ?>images/edit_icon.png">
									</div>
								</div>
								<div class="content-comment">
									<div data-bind="template: { name: $root.templateCmToUse}">				
								
									</div>
								</div>
								<div class="comment-time col-md-3">
									<p data-bind="text: comment_time"></p>
								</div>
							</div>
						</li>
					</ul>
					<a class="loadMore">Load more</a>
					
					<input type="text" class="form-control comment" placeholder="Viết lời bình luận" data-bind="event: {keypress: $parent.AddComment}">
					
				</div>

			</div>
			<script id="editTmpl" type ="text/html">
				<input type="text" class="post-content" data-bind="textInput: post_content, event: {keypress: $root.EditComplete}">
				<button type="button" class="cancel" class="btn btn-default" data-bind="click: $root.Cancel">Hủy</button>
			</script>
			<script id="itemTmpl" type="text/html">
				<div class="post-content" data-bind="text: post_content"></div>
			</script>
			
			<script id="editCmTmpl" type ="text/html">
				<input type="text" data-bind="textInput: comment_content, event: {keypress: $root.EditCmComplete}">
				<button type="button" class="cancel" class="btn btn-default" data-bind="click: $root.CancelCm">Hủy</button>
			</script>
			<script id="itemCmTmpl" type ="text/html">
				<p data-bind="text: comment_content"></p>
			</script>
									<!--[CDATA[<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
						<script type="text/javascript" src="js/readmore.min.js"></script>
						<script>
							$('.post-content').readmore({maxHeight: 40});
						</script>-->
			<script type="text/javascript" src="<?php echo base_url(); ?>js/my-knockout.js"></script>
		</div>	
	</div>
</body>