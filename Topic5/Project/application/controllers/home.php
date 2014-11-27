<?php 
	/**
	* 
	*/
	class Home extends CI_Controller
	{
		
		function __construct()
		{
			parent::__construct();
			$this->load->helper("url");
		}
		public function index()
		{
			$temp['title'] = "Trang chủ"; 
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
				$this->load->view("blogging/vhome",$temp);				
			}
				
		}
		public function load_post()
		{			
			$temp['title'] = "Trang chủ"; 
			$temp['message'] = '';
			$temp['content'] = '';
			$this->load->helper('form');
			$this->load->model('blogging_model');
			$q_post = $this->blogging_model->load_home_page();
			
			$arr_post = array();
			foreach ($q_post->result_array() as $row)
			{
				$arr_post[] = $row;
			}	
			echo json_encode($arr_post);
		}
		public function load_userpage()
		{			
			
			$obj = json_decode($_POST["mydata"]);
			
			$this->load->model('blogging_model');
			$q_post = $this->blogging_model->load_user_page($obj[0]);
			
			$arr_post = array();
			foreach ($q_post->result_array() as $row)
			{
				$arr_post[] = $row;
			}	
			echo json_encode($arr_post);
		}
		public function get_user()
		{	
			$this->load->library('session');
			echo $this->session->userdata('user_id');
		}
		public function get_username()
		{	
			$this->load->library('session');
			echo $this->session->userdata('username');
		}
		public function insert_post()
		{
			$obj = json_decode($_POST["mydata"]);
			
			$this->load->model('blogging_model');
			$pid = $this->blogging_model->insert_post($obj[0],$obj[1],$obj[2]);
			echo $pid;
		}
		public function insert_comment()
		{
			$obj = json_decode($_POST["mydata"]);
			
			$this->load->model('blogging_model');
			$pid = $this->blogging_model->insert_comment($obj[0],$obj[1],$obj[2]);
			echo $pid;
		}
		public function delete_post()
		{
			$obj = json_decode($_POST["mydata"]);
			$this->load->model('blogging_model');
			$this->blogging_model->delete_post($obj[0]);
		}
		public function delete_comment()
		{
			$obj = json_decode($_POST["mydata"]);
			$this->load->model('blogging_model');
			$this->blogging_model->delete_comment($obj[0]);
		}
		public function update_post()
		{
			$obj = json_decode($_POST["mydata"]);
			$this->load->model('blogging_model');
			$this->blogging_model->update_post($obj[0], $obj[1]);
		}
		public function update_comment()
		{
			$obj = json_decode($_POST["mydata"]);
			$this->load->model('blogging_model');
			$this->blogging_model->update_comment($obj[0], $obj[1]);
		}
	}
?>