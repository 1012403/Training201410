<?php 
	/**
	* 
	*/
	class Login extends CI_Controller
	{
		
		function __construct()
		{
			parent::__construct();
			$this->load->helper("url");
		}
		public function index()
		{		
			$temp['title'] = "Đăng nhập";
			$this->load->helper('form');
			$this->load->library('session');


			$temp['user_id'] = "";
			$temp['user_id'] = $this->session->userdata('user_id');
			$temp['username'] = $this->session->userdata('username');
			if(!empty($temp['user_id']))
			{				
				redirect("home", "location");
			}	

			if($this->input->post('username'))
				$username = $this->input->post('username');
			else
				$username = '';
			if($this->input->post('password'))
				$pass = $this->input->post('password');
			else
				$pass = '';
			$this->load->model('blogging_model');
			if($this->blogging_model->check_login($username,$pass) == 1)
			{	
				$a = $this->blogging_model->get_userid($username);
				foreach ($a->result() as $row)
				{
					$newdata = array(
                   		'username'  => $username,
                   		'user_id'     => $row->user_id
               		);
               		$this->session->set_userdata($newdata);
				}
				$this->load->helper('url');
				redirect('home','refresh');	
			}
			else
			{
				$this->load->view("blogging/vlogin",$temp);
			}						
		}
	}
?>