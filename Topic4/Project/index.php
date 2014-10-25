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
				WHERE posts.user_id = user1.user_id AND posts.user_post = user2.user_id ORDER BY post_time DESC";
				$r = mysql_query($q)or die("Query {$query} </br> MySQL Error:" . mysql_error($dbc));;
				//$num =  mysql_fetch_array($r,MYSQL_NUM);
				while($post = mysql_fetch_assoc($r))
				{
					echo "<div class=\"posts well well-lg\">
							<div class=\"row\">
								<div class=\"userpost col-md-8\">
									<a href=\"#\"><b>".$post['usn2']."</b></a>
								</div>";
					echo "<div class=\"post-time col-md-4\">".$post['post_time']."</div>";
					echo "<div class=\"post-content\">".$post['post_content']."</div>";
					echo "	</div>";
					echo "<input type=\"text\" class=\"form-control\" postvalue = \"".$post['post_id']."\" placeholder=\"Viết lời bình luận\"></div>";
				}

				/*<div class="comments">
					<div class="comment well well-sm ">
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
					
				</div>
				*/
				echo "</div>
						</div>
							</body>";
			?>
			<!--<div class="posts well well-lg">
				<div class="row">
					<div class="userpost col-md-8">
						<a href="#"><b>Khoa đại ca</b></a>
					</div>
					<div class="post-time col-md-4">
						11:00 pm 21/10/2014
					</div>
				
				
					<div class="post-content">
						trường mình có khoảng 1400 học sinh, 
						tạm xét tỉ lệ nữ:nam là 7:3. Như z ta có 420 nam,
						 tức là 420 cặp đôi(trừ trường họp đặt biệt nếu có). 
						 Theo tình hình cfs cho thấy trung bình mỗi ngày có khoảng 10 lời tỏ tình,
						  thì chỉ trong vòng 6 tuần đã... Còn lại 1 số là FA, đương nhiên con số nà
						  y ko thể nào chính xác, vì có thể nhiu cfs gửi cho cùng 1 ng và ngược lại, hoặc 
						  chỉ là những cfs mang tính chất troll. Trên đây là một số tính toán ko khoa học củ
						  a em 
					</div>
				<div class="comments">
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
				</div>
				<input type="text" class="form-control" placeholder="Viết lời bình luận">
				</div>
			</div>
		</div>
	</div>
</body>-->