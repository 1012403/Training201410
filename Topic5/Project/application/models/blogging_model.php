<?php
	class blogging_model extends CI_Model
	{
   		function books_model()
   		{
          parent::Model();
          $this->load->helper('url'); 
          $this->load->database();
   		}
   		public function check_login($username, $password)
   		{
   			$this->load->database();
   			$this->db->where('username',$username);
   			$pass = SHA1($password);
   			$query = $this->db->where('password',$pass);   			
   			$this->db->from('users');
   			return $this->db->count_all_results();
   		}
   		public function get_userid($username)
   		{
   			$this->load->database();
            $cur = new DateTime();
            $cur = $cur->format('Y-m-d H:i:s');
            $q = "SELECT user_id
                  FROM users
                  WHERE username = '{$username}'
                  LIMIT 1";
            $query = $this->db->query($q);
            
            return $query;
   		}
         public function check_username($username)
         {
            $this->load->database();
            $this->db->select('user_id');
            $this->db->where('username',$username);                     
            $this->db->from('users');
            $result = $this->db->count_all_results();
            if($result == 0)
               return true;
            return false;
         }
         public function check_email($email)
         {
            $this->load->database();
            $this->db->select('user_id');
            $this->db->where('email',$email);                     
            $this->db->from('users');
            $result = $this->db->count_all_results();
            if($result == 0)
               return true;
            return false;
         }
         public function insert_user($username, $password, $email, $activatecode)
         {
            $this->load->database();
            $data = array(
                  'username' => $username ,
                  'email' => $email ,
                  'password' => SHA1($password),
                  'active'   => $activatecode,
               );
            $this->db->insert('users', $data);  
         }
         public function update_active_account($email, $actcode)
         {
            $data = array(
               'active' => NULL,
            );
            $this->db->where('email', $email);
            $this->db->where('active', $actcode);
            $this->db->update('users', $data);
            return $this->db->affected_rows();
         }
         public function reset_password($email, $password)
         {
            $pass = SHA1($password);
            $data = array(
               'password' => $pass,
            );
            $this->db->where('email', $email);
            $this->db->update('users', $data);
            return $this->db->affected_rows();
         }
         public function load_home_page()
         {
            $this->load->database();
            $q = "SELECT user1.user_id,user2.user_id,user1.username usn1,user2.username usn2,post_content,post_time,post_id
            FROM users user1, users user2,posts 
            WHERE posts.user_id = user1.user_id AND posts.user_post = user2.user_id ORDER BY post_time DESC";
            $query = $this->db->query($q);
            return $query;
         }
         public function load_user_page($username)
         {
            $this->load->database();
            $q = "SELECT user1.user_id,user2.user_id,user1.username usn1,user2.username usn2,post_content,post_time,post_id
            FROM users user1, users user2,posts 
            WHERE posts.user_id = user1.user_id AND posts.user_post = user2.user_id AND usn1 = '{$username}' ORDER BY post_time DESC";
            $query = $this->db->query($q);
            return $query;
         }
         public function get_comments($post_id)
         {
            $this->load->database();
            $q = "SELECT *
               FROM comments , users
               WHERE (post_id = '{$post_id}' AND comments.user_id = users.user_id) ORDER BY comment_time ASC";
            $query = $this->db->query($q);
            return $query;
         }
         public function insert_post($user_id, $content, $user_post)
         {
            $this->load->database();
            $cur = new DateTime();
            $cur = $cur->format('Y-m-d H:i:s');
            $q = "INSERT INTO posts (user_id,post_content,post_time,user_post) 
                  VALUES ('{$user_id}', '{$content}', '{$cur}', '{$user_post}')";
            $query = $this->db->query($q);
            
            return $this->db->insert_id();
         }
         public function insert_comment($post_id, $user_id, $content)
         {
            $this->load->database();
            $timezone = new DateTimeZone('Etc/GMT+7');
            $cur = new DateTime();
            $cur->setTimezone($timezone);
            $cur = $cur->format('Y-m-d H:i:s');
            $q = "INSERT INTO comments (post_id,user_id,comment,comment_time) 
                  VALUES ('{$post_id}','{$user_id}', '{$content}', '{$cur}')";
            $query = $this->db->query($q);
            
            return $this->db->insert_id();
         }
         public function delete_post($post_id)
         {
            $this->load->database();
            $q2 = "DELETE FROM comments
                  WHERE ( post_id = '{$post_id}')";
            $query = $this->db->query($q2);
            
            $q = "DELETE FROM posts
                  WHERE ( post_id = '{$post_id}')";
            $query = $this->db->query($q);
         }
         public function delete_comment($comment_id)
         {
            $this->load->database();
            $q = "DELETE FROM comments
                  WHERE ( comment_id = '{$comment_id}')";
            $query = $this->db->query($q);
         }
         public function update_post($post_id, $post_content)
         {
            $this->load->database();
            $cur = new DateTime();
            $cur = $cur->format('Y-m-d H:i:s');
            $q = "UPDATE posts
                  SET post_content = '{$post_content}', post_time = '{$cur}'
                  WHERE post_id = '{$post_id}'";
            $query = $this->db->query($q);
         }
         public function update_comment($comment_id, $comment_content)
         {
            $this->load->database();
            $cur = new DateTime();
            $cur = $cur->format('Y-m-d H:i:s');
            $q = "UPDATE comments
                  SET comment = '{$comment_content}', comment_time = '{$cur}'
                  WHERE comment_id = '{$comment_id}'";
            $query = $this->db->query($q);
         }
	}
?>