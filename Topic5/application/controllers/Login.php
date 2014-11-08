<?php
	class Login extends CI_Controller{
		public function __construct(){
			parent::__construct();
			 $this->load->helper('url');
			 $this->load->library('session');
			 $this->load->library('my_auth');
		}
		public function index(){
			$this->load->helper('form');
			$this->load->library('form_validation');
			$this->form_validation->set_rules('email', 'Email', 'valid_email|callback_checkusername');
			$this->form_validation->set_rules('password', 'Password', 'required|callback_checkpassword');
			if ($this->form_validation->run() == FALSE){
				$this->load->view('login_view');
			}
			else
			{
				$userID = $this->Muser->userId($this->input->post("email"));
			
				if ($this->my_auth->is_Active($userID) == false){
					$this->load->view("register_success");
				}
				else{
					 $data = array(
                                    "email"  => $this->input->post("email"),
                                    "userid"    => $userID,
                                    
                                );
					$this->my_auth->set_userdata($data);
					redirect(base_url()."index.php/post/showpostview");
				}
			}
		}
		public function checkusername($str){
			$this->load->Model("Muser");
			if ($this->Muser->checkValidUser($str) == true){
				               
           		 return true; 
			}
			else{
			 $this->form_validation->set_message('checkusername', '%s chưa được đăng ký.');    
				return false;
			}
		}
		public function checkpassword($str){
			$userName = $_POST['email'];

			$this->load->Model("Muser");
			if ($this->Muser->checkPasswordUser($userName,$str) == false){
				$this->form_validation->set_message('checkpassword','%s không chính xác');
				return false;
			}
			else{
				return true;
			}
		}

		public function logout()
	    {
	        $this->my_auth->sess_destroy();
			redirect(base_url()."index.php/login");
	    }
	}
?>