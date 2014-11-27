<?php 
	/**
	* 
	*/
	class Logout extends CI_Controller
	{
		
		function __construct()
		{
			parent::__construct();
			$this->load->helper("url");
		}
		public function index()
		{
			$temp['title'] = "Đăng xuất"; 
			$temp['message'] = '';
			$temp['content'] = '';

			$this->load->helper('form');
			$this->load->library('session');
			$temp['user_id'] = "";
			$temp['user_id'] = $this->session->userdata('user_id');
			$temp['username'] = $this->session->userdata('username');
			if(empty($temp['user_id']))
			{				
				redirect("login", "location");
			}				
			else
			{
				$this->session->sess_destroy();
				$temp['message'] = 'Bạn đã đăng xuất thành công.';
				$this->load->view("blogging/vlogout",$temp);				
			}
				
		}		
	}
?>