<?php
	class Register extends CI_Controller{
		 var $_register = "register";
		  var $_fgpassword = "fgpassword";
		public function __construct(){
			parent::__construct();
			$this->load->helper('url');
			$this->load->library('session');
			 $this->load->library('my_auth');
			 $this->load->helper('string');
		}
		public function index(){
			 if($this->my_auth->is_Login()){
	            redirect(base_url()."index.php/Login");
	            exit();
	        }
			$this->load->helper('form');
			$this->load->library('form_validation');
			$this->form_validation->set_rules('fname', 'First name', 'required');
			$this->form_validation->set_rules('lname', 'Last name', 'required');
			$this->form_validation->set_rules('email', 'Email', 'required|callback_checkusername|valid_email');
			$this->form_validation->set_rules('password1','Password','required|matches[password2]');
			$this->form_validation->set_rules('password2','Password Confirmation','required');
			if ($this->form_validation->run() == FALSE){
				$this->load->view('register_view');
			}
			else
			{
				$this->load->Model('Muser');
				$data = array(
					'FName' => $this->input->post("fname"),
					'LName' => $this->input->post("lname"),
					'Dob' => $_POST['dob'],
					'Email' => $this->input->post("email"),
					'Password' => crypt($this->input->post("password1")),
					'Address' => $this->input->post("address"),
					'Active' =>0,
					);
				$message = "";
                $mail = array();
				if ($this->Muser->addUser($data)){
					$userid = mysql_insert_id();
					$link_active = base_url()."/index.php/register/activate/?userId=".$userid;
					$message  = "Please follow this link to active your acount <br/>".
                    $message .= "Link : <a href=".$link_active.">".$link_active."</a><br/>";
                    $message .= "email: ".$data['Email']."<br/>";
                    $message .= "password : ".$this->input->post("password1");

                    $mail = array(
                            "to_receiver"   => $data['Email'], 
                            "message"       => $message,
                        );

                    $this->load->library(array("email","my_email"));
                    $this->my_email->config($mail);
                    $this->my_email->sendmail();
                    $this->session->set_userdata(array($this->_register => TRUE));
                   
                    redirect(base_url()."/index.php/Register/register_complete");
				}

			}
		}
		public function checkusername($str){
			$this->load->Model("Muser");
			if ($this->Muser->checkValidUser($str) == true){
				 $this->form_validation->set_message('checkusername','%s đã tồn tại');
           		 return false; 
			}
			else{
			 
				return true;
			}
		}

		public function register_complete(){
			 if($this->my_auth->is_Login()){
	            redirect(base_url()."index.php/Login");
	            exit();
	        }
			if ($this->session->userdata($this->_register)==TRUE){
				$this->load->view('register_success');
			}
			else{
				redirect(base_url()."/index.php/Login");
			}
		}

		public function activate(){
			 if($this->my_auth->is_Login()){
	            redirect(base_url()."index.php/Login");
	            exit();
	        }
			 $userid = $_GET['userId'];
			 $this->load->Model("Muser");
			 $data = array();
			 if ($this->Muser->isActiveState($userid) == true){
			 	 
			 	 $this->session->unset_userdata($this->_register);
			 }
			 else{
			 	$update = array(
			 		'active' =>1);
			 	$this->Muser->updateUser($userid,$update);
			 }
			 $data['report'] = "Account has been activated, <a href='".base_url()."/index.php/login'>please login</a> !";
			 $this->load->view('report_view',$data);
		}

		public function resetpass(){
			 if($this->my_auth->is_Login()){
	            redirect(base_url()."index.php/Login");
	            exit();
	        }
	        $this->load->helper('form');
			$this->load->library('form_validation');
			$this->form_validation->set_rules('email', 'Email', 'required|callback_checkemalValid|valid_email');
			if ($this->form_validation->run() == FALSE){
				$this->load->view('resetpass_view');
			}
			else{
				$email = $this->input->post('email');
				$newpassword = random_string('alnum',5);
				$this->load->Model("Muser");
				$userid = $this->Muser->userId($email);
				if ($this->Muser->isActiveState($userid) == true){
					 $reset = array(
                                "Password" => crypt($newpassword),
                            );
					 $this->Muser->updateUser($userid,$reset);
					$message  = "Please login with :<br/>";
	                $message .= "username :".$email."<br/>";
	                $message .= "password:".$newpassword;
	                
	                $mail = array(
	                            "to_receiver"   => $email,
	                            "message"       => $message,
	                        );
					
					$this->load->library(array("email","my_email"));
                    $this->my_email->config($mail);
                    $this->my_email->sendmail();
                    $this->session->set_userdata(array($this->_fgpassword => TRUE));
                      redirect(base_url()."/index.php/Register/resetpass_complete");
                }
			}

		}

		public function resetpass_complete(){
			if($this->session->userdata($this->_fgpassword)==TRUE){
	            $data['report'] = "Please check your email to receive the new password ! <a href='".base_url()."/index.php/login'>please login</a>";
	            $this->load->view("report_view",$data);
	            $this->session->unset_userdata($this->_fgpassword);
	        }else{
	            redirect(base_url()."index.php/login");
	        }
		}

		public function checkemailValid($str){
			$this->load->Model("Muser");
			if ($this->Muser->isValidEmail($str) == true){
				return true;

			}
			else{
				 $this->form_validation->set_message("checkemailValid","Email is not avaliable , please try again !");
				return false; 
			}
		}

		public function editUser($userid){
			$this->load->Model("Muser");
			$data['userInfo'] = $this->Muser->getInfoById($userid);
		
			$this->load->helper('form');
			$this->load->library('form_validation');
			
		
			$this->form_validation->set_rules('passwordnew','Password','matches[passwordconfirm]');
		
			if ($this->form_validation->run() == FALSE){

				$this->load->view('edit_userView', $data);
			}
			else
			{
				$this->load->Model('Muser');
				$data = array(
					'FName' => $this->input->post("fname"),
					'LName' => $this->input->post("lname"),
					'Dob' => $_POST['dob'],
				
					'Password' => crypt($this->input->post("passwordnew")),
					'Address' => $this->input->post("address"),
					
					);
			
				if ($this->Muser->updateUser($userid,$data) == true){    
					$this->load->view("edit_success");
				}

			}

		}

	}
?>