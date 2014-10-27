<?php include('includes/header.php') ?>
<?php include('includes/mysql_connect.php') ?>
<?php include('includes/functions.php') ?>
		<div class="content col-md-offset-3 ">
			<div class="post-area">
				<h4>Cập nhật trạng thái</h4>
				<textarea name="" id="post-content" cols="105" rows="6"></textarea>
				<button type="button" id="poston" class="btn btn-default" >Đăng bài</button>
			</div>
			<?php 
				$q = "SELECT user1.user_id,user2.user_id,user1.username usn1,user2.username usn2,post_content,post_time,post_id
				FROM users user1, users user2,posts 
				WHERE posts.user_id = user1.user_id AND posts.user_post = user2.user_id ORDER BY post_time DESC";
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
					WHERE (post_id = {$post['post_id']} AND comments.user_id = users.user_id) ORDER BY comment_time ASC";
					$r1 = mysql_query($q1)or die("Query {$query} </br> MySQL Error:" . mysql_error($dbc));
					//$num =  mysql_fetch_array($r,MYSQL_NUM);
					$i = 0;
					echo "<ul class=\"list-comments\">";
					while($cm = mysql_fetch_assoc($r1))
					{
						$i++;
						if($i > 5)
							break;
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
					if($i > 4)
						echo "<a class=\"loadMore\" postvalue = \"".$post['post_id']."\" >Load more</a>";
					echo "<input type=\"text\" class=\"form-control comment\" postvalue = \"".$post['post_id']."\" placeholder=\"Viết lời bình luận\"></div>";
				}
				echo "</div>
						</div>"?>
						<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
						<script type="text/javascript" src="js/readmore.min.js"></script>
						<script>
							$('.post-content').readmore({maxHeight: 40});
						</script>
						
							</body>