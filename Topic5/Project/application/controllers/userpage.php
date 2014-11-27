<?php 
	/**
	* 
	*/
	class Userpage extends CI_Controller
	{
		
		function __construct()
		{
			parent::__construct();
			$this->load->helper("url");
		}
		public function index($username)
		{
			$temp['title'] = $username; 
			$temp['persname'] = $username;
			$temp['message'] = '';
			$temp['content'] = '';

			$this->load->helper('form');
			$this->load->library('session');
			$temp['user_id'] = $this->session->userdata('user_id');
			$temp['username'] = $this->session->userdata('username');
			if(isset($temp['user_id']))
				$this->load->view("blogging/vuserpage",$temp);
			else
				redirect("login", "location");
		}
		public function get_userid()
		{
			$obj = json_decode($_POST["mydata"]);
			
			$this->load->model('blogging_model');
			$query = $this->blogging_model->get_userid($obj[0]);
			foreach ($query->result() as $row)
			{
			    echo $row->user_id;
			}
		}
	}
?>