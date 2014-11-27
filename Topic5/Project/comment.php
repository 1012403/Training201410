<?php 
	// ket noi
	$dbc = mysql_connect('localhost','root','');
	// chon scdl thao tac
	if(!$dbc)
	{
		die('Not connect: '.mysql_error());
	}
	$state = mysql_select_db('blogging_cms',$dbc);
	if(!$state)
	{
		die('Can not selected database:'.mysql_error());
	}

	$q = "SELECT post_id, comment_id, users.user_id user_id, comment, comment_time, username 
	FROM users , comments 
	WHERE comments.user_id = users.user_id ORDER BY comment_time DESC ";
	$r = mysql_query($q) or die("Query error ".mysqli_error($dbc));
	$array_post = array();
	while($data = mysql_fetch_assoc($r))
	{
		$array_post[] = $data;
	}
	//echo $array_post;
	echo json_encode($array_post);	
?>