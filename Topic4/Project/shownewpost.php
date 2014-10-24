
<?php include('includes/mysql_connect.php') ?>
<?php 
	$q = "SELECT user_id FROM users WHERE username='{$_POST['username']}'";
	$r = mysql_query($q);
	list($user) = mysql_fetch_array($r,MYSQL_NUM);

	$query = "INSERT INTO posts (user_id,post_content,post_time,user_post) 
	VALUES ('{$user}', '{$_POST['content']}', NOW(), '{$user}')";
	$result = mysql_query($query) or die("Query {$query} </br> MySQL Error:" . mysql_error($dbc));
	if(mysql_affected_rows($dbc) != 1)
	{
		echo "<p class=\"warning\">Post Error</p>";
	}
	//echo $_POST['username'];
?>
<div class="posts well well-lg">
	<div class="row">
		<div class="userpost col-md-8">
			<a href="#"><b><?php echo $_POST['username']; ?> </b></a>
		</div>
		<div class="post-time col-md-4">
			<?php echo date ("d M Y, h:i:s A", mktime()); ?>
		</div>
	
	
		<div class="post-content">
			<?php echo $_POST['content']; ?>
		</div>

		
			<div class="comment well well-sm">
				<div class="user-comment">
					<a href="#"><b>Thi chó đốm</b></a>
				</div>
				<div class="content-comment">
					la la l al al la l l la la al 
				</div>
				<div class="comment-time">
					11:10 pm 21/10/2014
				</div>
			</div>
			<div class="comment well well-sm">
				<div class="user-comment">
					<a href="#"><b>Phương mặt sẹo</b></a>
				</div>
				<div class="content-comment">
					ns ns dnsd sndns dns
				</div>
				<div class="comment-time">
					11:15 pm 21/10/2014
				</div>
			</div>
		
		<input type="text" class="form-control" placeholder="Viết lời bình luận">
	</div>
</div>