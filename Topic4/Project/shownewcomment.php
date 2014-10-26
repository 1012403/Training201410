
<?php include('includes/mysql_connect.php') ?>
<?php 
	$q = "SELECT user_id FROM users WHERE username='{$_POST['username']}'";
	$r = mysql_query($q);
	list($user) = mysql_fetch_array($r,MYSQL_NUM);

	$query = "INSERT INTO comments (post_id,user_id,comment,comment_time) 
	VALUES ('{$_POST['post_id']}', '{$user}', '{$_POST['content']}', NOW())";
	$result = mysql_query($query) or die("Query {$query} </br> MySQL Error:" . mysql_error($dbc));
	if(mysql_affected_rows($dbc) != 1)
	{
		echo "<p class=\"warning\">Comment Error</p>";
	}
?>

<div class="comment well well-sm">
	<div class="user-comment">
		<?php echo "<a href=\"userpage.php?username=".$_POST['username']."\"><b>". $_POST['username']."</b></a>"?>
	</div>
	<div class="content-comment">
		<?php echo $_POST['content']?>
	</div>
	<div class="comment-time">
		<?php echo date ("d M Y, h:i:s A", mktime()); ?>
	</div>
</div>