<?php include('includes/header.php') ?>
<?php include('includes/mysql_connect.php') ?>
<?php include('includes/functions.php') ?>
		<div class="content col-md-offset-3 ">
			<div class="post-area">
				<h4>Cập nhật trạng thái</h4>
				<textarea name="" id="post-content" cols="105" rows="3"></textarea>
				<button type="button" id="poston" class="btn btn-default" >Đăng bài</button>
			</div>
			<?php 

				$q = "SELECT user1.user_id,user2.user_id,user1.username usn1,user2.username usn2,post_content,post_time,post_id
				FROM users user1, users user2,posts 
				WHERE posts.user_id = user1.user_id AND posts.user_post = user2.user_id AND user1.username = '{$_GET['username']}' ORDER BY post_time DESC";
				$r = mysql_query($q)or die("Query {$query} </br> MySQL Error:" . mysql_error($dbc));;
				//$num =  mysql_fetch_array($r,MYSQL_NUM);
				while($post = mysql_fetch_assoc($r))
				{
					echo "<div class=\"posts well well-lg\">
							<div class=\"row\">
								<div class=\"userpost col-md-8\">
									<a href=\"userpage.php?username=".$post['usn2']."\"><b>".$post['usn2']."</b></a>
								</div>";
					echo "<div class=\"post-time col-md-4\">".$post['post_time']."</div>";
					echo "<div class=\"post-content\">".$post['post_content']."</div>";
					echo "	</div>";

					//comment
					$q1 = "SELECT *
					FROM comments , users
					WHERE (post_id = {$post['post_id']} AND comments.user_id = users.user_id) ORDER BY comment_time DESC";
					$r1 = mysql_query($q1)or die("Query {$query} </br> MySQL Error:" . mysql_error($dbc));;
					//$num =  mysql_fetch_array($r,MYSQL_NUM);
					while($cm = mysql_fetch_assoc($r1))
					{
						echo "<div class=\"comment well well-sm\">
							<div class=\"user-comment\">
								<a href=\"userpage.php?username=".$cm['username']."\"><b>". $cm['username']."</b></a>
							</div>
							<div class=\"content-comment\">
								". $cm['comment']."
							</div>
							<div class=\"comment-time\">
								". date ("d M Y, h:i:s A", mktime())."
							</div>
						</div>";
					}

					echo "<input type=\"text\" class=\"form-control comment\" postvalue = \"".$post['post_id']."\" placeholder=\"Viết lời bình luận\"></div>";
				}
					echo "</div>
							</div>
								</body>";
			?>
			