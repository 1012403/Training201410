<?php
	class Muser extends CI_Model{
		public function __construct(){
			parent::__construct();
			$this->load->database();
		}
		public function checkValidUser($user){
			$query = $this->db->query("Select UserID from user where Email = '{$user}'");
			if ($query->num_rows() > 0){
				
				return true;
			}
			else {
			
				return false;
			}
		}
		public function checkPasswordUser($user,$password){

			$query = $this->db->query("Select Password from user where Email = '{$user}'");

			if ($query->num_rows() > 0){
				
				$row = $query->row();
				$dbpassword = $row->Password;
		
				if (crypt($password,$dbpassword) !=$dbpassword){
					return false;
				}
				else{
					return true;
				}
			}
			else{
				
				return false;
			}
		}

		public function addUser($data){
			if ($this->db->insert("user",$data)){
				return true;
			}
			else {
				return false;
			}
		}
		public function isActiveState($userid){
			$query = $this->db->query("Select Active from user where UserID = '{$userid}'");
			if ($query->num_rows() > 0){
				$row = $query->row();
				$activeState = $row->Active;
				if ($activeState == 1){
					return true;
				}
				else {
					return false;
				}
			}
		}

		public function updateUser($userid,$update){
			$this->db->where("UserID",$userid);
			$this->db->update("user",$update);
			return true;
		}

		public function userId($email){
			$query = $this->db->query("Select UserID from user where Email = '{$email}'");
			if ($query->num_rows() > 0){
				$row = $query->row();
				return $row->UserID;
			}
		}
		
		public function getEmail($id){
			$query = $this->db->query("Select Email from user where UserID = '{$id}'");
			if ($query->num_rows() > 0){
				$row = $query->row();
				return $row->Email;
			}
		}	

		public function getName($id){
			$name = "";
			$query = $this->db->query("Select FName,LName from user where UserID = '{$id}'");
			if ($query->num_rows() > 0){
				$row = $query->row();
				$name = $row->FName." ".$row->LName;
				return $name;
			}
			
		}

		public function getInfoById($id){
			$query = $this->db->query("Select UserID, FName, LName, Dob, Email, Password, Address from user where UserID = '{$id}'");
			if ($query->num_rows() > 0){
				$row = $query->row();
				$data = array(
					"UserID" => $row->UserID,
					"FName" => $row->FName,
					"LName" => $row->LName,
					"Dob" => $row->Dob,
					"Email" => $row->Email,
					"Password" => $row->Password,
					"Address" => $row->Address);
				return $data;
			}
			
		}


	}
?>