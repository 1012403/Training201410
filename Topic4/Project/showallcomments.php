
<?php include('includes/mysql_connect.php') ?>

<?php
	$q1 = "SELECT *
	FROM comments , users
	WHERE (post_id = '{$_POST['post_id']}' AND comments.user_id = users.user_id) ORDER BY comment_time ASC";
	$r1 = mysql_query($q1)or die("Query {$query} </br> MySQL Error:" . mysql_error($dbc));
	//$num =  mysql_fetch_array($r,MYSQL_NUM);
	$i = 0;
	echo "<ul class=\"list-comments\">";
	while($cm = mysql_fetch_assoc($r1))
	{
		$i++;
		//if($i < 5)
		//	continue;
		echo "<li><div class=\"comment well well-sm\">
			<div class=\"user-comment\">
				<a href=\"userpage.php?username=".$cm['username']."\"><b>". $cm['username']."</b></a>
			</div>
			<div class=\"content-comment\">
				". $cm['comment']."
			</div>
			<div class=\"comment-time\">
				". $cm['comment_time']."
			</div>
		</div></li>";
	}
	echo "</ul>";
?>