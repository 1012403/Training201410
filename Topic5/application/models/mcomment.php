<?php
	class Mcomment extends CI_Model{
		public function __construct(){
			parent::__construct();
			$this->load->database();
		}

		public function listComment($postID){
			$query = $this->db->query("Select C.Content, C.PostID,C.CmtID, C.UserID from comment C where C.PostID = '{$postID}'");
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

		public function dellComment($CmtID){
			 $this->db->where("CmtID","$CmtID");
     	     $this->db->delete("comment");
     	     return true;
		}

		
		public function updateComment($data, $CmtID)
		{
			$this->db->where("CmtID","$CmtID");
			$this->db->update("comment",$data);
		
		}
		

	}
?>