<?php
	class Mcomment extends CI_Model{
		public function __construct(){
			parent::__construct();
			$this->load->database();
		}

		public function listComment($postID){
			$query = $this->db->query("Select C.Content, C.PostID,C.CmtID from comment C where C.PostID = '{$postID}'");
			return $query->result_array();
		}

		public function addComment($data){
			if ($this->db->insert("comment",$data)){
				return true;
			}
			else{
				return false;
			}

		}
		

	}
?>