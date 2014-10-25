
<?php include('includes/mysql_connect.php') ?>
<?php 
	$q = "SELECT user_id FROM users WHERE username='{$_POST['username']}'";
	$r = mysql_query($q);
	list($user) = mysql_fetch_array($r,MYSQL_NUM);
	$query = "INSERT INTO posts (user_id,post_content,post_time,user_post) 
	VALUES ('{$user}', '{$_POST['content']}',NOW(), '{$user}')";
	$result = mysql_query($query) or die("Query {$query} </br> MySQL Error:" . mysql_error($dbc));
	if(mysql_affected_rows($dbc) != 1)
	{
		echo "<p class=\"warning\">Post Error</p>";
	}
	$q2 = "SELECT post_id FROM posts WHERE user_post='{$user}' ORDER BY post_time DESC LIMIT 1";
	$r2 = mysql_query($q2);
	list($post_id) = mysql_fetch_array($r2,MYSQL_NUM);
	//echo $_POST['username'];
?>
<?php echo "<div class=\"posts well well-lg\">
	<div class=\"row\">
		<div class=\"userpost col-md-8\">
			<a href=\"#\"><b>".$_POST['username']." </b></a>
		</div>
		<div class=\"post-time col-md-4\">
			".date ("d M Y, h:i:s A", mktime())."
		</div>
		<div class=\"post-content\">
			". $_POST['content']."
		</div>
	</div>"?>
	<?php echo "<input type=\"text\" class=\"form-control\" postvalue = \"".$post_id."\" placeholder=\"Viết lời bình luận\"></div></div>" ?>
