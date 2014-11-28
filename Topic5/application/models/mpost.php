<?php
	class MPost extends CI_Model{
		public function __construct(){
			parent::__construct();
			$this->load->database();
		}

		public function addPost($data){
			if ($this->db->insert("post",$data)){
				return true;
			}
			else{
				return false;
			}
		}

		public function getPostTitle($id){
			$this->db->select('PostTitle');
			$this->db->where('PostID',$id);
			$query=$this->db->get('post');
        	if ($query->num_rows() >0){
        		$row = $query->row();
        		return $row->PostTitle;
        	}
		}

		public function getPostContent($id){
			$this->db->select('Content');
			$this->db->where('PostID',$id);
			$query = $this->db->get('post');
			if ($query->num_rows() > 0 ){
				$row = $query->row();
				return $row->Content;
			}
		}

	
		public function listPostByUser($id){
			$query = $this->db->query("Select P.PostID, P.PostTitle, P.Content, P.PostUser, P.GivenUser, U.Email from user U join post P on U.UserID = P.GivenUser where U.UserID = '{$id}'");
			
			return $query->result_array();
		
		}
		
		public function listPost(){
			$query = $this->db->query("Select P.PostID, P.PostTitle, P.Content, P.PostUser, P.GivenUser, U.Email from user U join post P on U.UserID = P.GivenUser");
			return $query->result_array();
		
		}

		public function dellPost($postID){
			$this->db->where("PostID","$postID");
			$this->db->delete("post");
			return true;
		}

		public function updatePost($data, $postID){
			$this->db->where("PostID",$postID);
			$this->db->update("post",$data);
			return true;
		}
		public function getMaxID(){
			$this->db->select_max('PostID','id');
			$query = $this->db->get('post');
			if ($query->num_rows() > 0){
				$row = $query->row();
				return $row->id;
			}
		}

		

	}
?>