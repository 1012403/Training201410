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

	class Posts
	{
		public $user_id1;
		public $user_id2;
		public $username1;
		public $username2;
		public $post_content;
		public $post_time;
		public $post_id;
		public $comments;
		function __construct($us_id1,$us_id2,$usname1,$usname2,$p_content,$p_time,$pid,$cms)
	    {
	        $this->user_id1 = $us_id1;
	        $this->user_id2 = $us_id2;
	        $this->username1 = $usname1;
	        $this->username2 = $usname2;
	        $this->post_content = $p_content;
	        $this->post_time = $p_time;
	        $this->post_id = $pid;
	        $this->comments = $cms;
	    } 
	}
	class Comments
	{
		public $post_id;
		public $comment_id;
		public $user_id;
		public $comment;
		public $comment_time;
		public $username;
		function __construct($pid,$cmid,$usid,$cm,$cmtime,$usn)
	    {
	        $this->post_id = $pid;
	        $this->comment_id = $cmid;
	        $this->user_id = $usid;
	        $this->comment = $cm;
	        $this->comment_time = $cmtime;
	        $this->username = $usn;
	    } 
	}

	$q = "SELECT user1.user_id usid1,user2.user_id usid2,user1.username usn1,user2.username usn2,post_content,post_time,post_id
            FROM users user1, users user2,posts 
            WHERE posts.user_id = user1.user_id AND posts.user_post = user2.user_id ORDER BY post_time DESC";
	$r = mysql_query($q) or die("Query error ".mysqli_error($dbc));
	$array_post = array();
	while($data = mysql_fetch_assoc($r))
	{
		$q2 = "SELECT post_id, comment_id, users.user_id, comment, comment_time, username 
			FROM users , comments 
			WHERE comments.post_id = '{$data['post_id']}' AND comments.user_id = users.user_id ORDER BY comment_time DESC";
		$r2 = mysql_query($q2) or die("Query error ".mysqli_error($dbc));
		$array_cm = array();
		while($data2 = mysql_fetch_assoc($r2))
		{
			$array_cm[] = new Comments($data2['post_id'],$data2['comment_id'],$data2['user_id'],$data2['comment'],
			$data2['comment_time'],$data2['username']);
		}
		
		$array_post[] = new Posts($data['usid1'],$data['usid2'],$data['usn1'],$data['usn2'],
			$data['post_content'],$data['post_time'],$data['post_id'],$array_cm);
		//print_r($array_post);
	}

	//echo $array_post;
	echo json_encode($array_post);	
?>