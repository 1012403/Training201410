<?php
	class Post extends CI_Controller{
		public function __construct(){
			parent::__construct();
			 $this->load->helper('url');
			 $this->load->Model("Mpost");
			 $this->load->library('session');
			 $this->load->library('my_auth');
			 $this->load->helper('string');
		}

		public function showPostView(){
	
			 if($this->my_auth->is_Login()){
				$data['listPost'] = $this->Mpost->listPost();
				$data['userId'] = $this->my_auth->__get("userid");
			 	$this->load->view('home_view',$data);
			 }
		}

		public function insertAPost(){
			 if($this->my_auth->is_Login()){
				$title = $_POST['PostTitle'];
				$content = $_POST['Content'];
				$data = array(
					"PostTitle" => $title,
					"Content" => $content,
					"View" => 0,
					"PostUser" => $_POST['PostUser'],
					"GivenUser" => $_POST['GivenUser'],
				);
				if ($this->Mpost->addPost($data) == true){
				

					$index = $this->Mpost->getMaxID();
					
					$this->load->Model("Muser");

					$email = $this->Muser->getEmail($_POST['GivenUser']);
				
					$result = array('Index' => $index,'Email' => $email);
					echo json_encode($result);
			
					
				}
				else {
					return false;
				}
				
			} 
		}

		public function dellAPost(){
			if ($this->my_auth->is_Login()){
				$postID = $_POST['PostID'];
				if ($this->Mpost->dellPost($postID) == true){
					return true;
				}
				else return false;
			}
		}

		public function updatePost(){
			if ($this->my_auth->is_Login()){
				$postID = $_POST['PostID'];
				$title = $_POST['PostTitle'];
				$content = $_POST['Content'];
				$data = array(
					"PostTitle" => $title,
					"Content" => $content,
					);
				if ($this->Mpost->updatePost($data,$postID) == true){
					return true;
				}
				else{
					return false;
				}
			}
		}

		public function showPostViewByUser($id){
			 if($this->my_auth->is_Login()){
			 	$data['listPost'] = $this->Mpost->listPostByUser($id);
			 	$this->load->Model("Muser");
			 	$data['userEmail'] = $this->Muser->getEmail($id);
			 	$data['userName'] = $this->Muser->getName($id);
			 	$data['userId'] = $id;
 			 	$this->load->view('user_view',$data);
			 }
		}

		public function viewPostDetail($postID){
			if ($this->my_auth->is_Login()){
				$this->load->Model("Mcomment");
				$data['listComment'] = $this->Mcomment->listComment($postID);
				$this->load->view('detail_view',$data);
			}
		}

		public function showCommentByPost(){
			if ($this->my_auth->is_Login()){
				$postID = $_POST['PostID'];		
				$this->load->Model("Mcomment");	
			$array = $this->Mcomment->listComment($postID);
			echo json_encode($this->Mcomment->listComment($postID));
		
			}
		}
	}
?>