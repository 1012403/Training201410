<?php 
	/**
	* 
	*/
	class getuser extends CI_Controller
	{
		
		function __construct()
		{
			parent::__construct();
			$this->load->helper("url");
		}
		public function get_user()
		{	
			$this->load->library('session');
			echo $this->session->userdata('user_id');
		}
		public function insert_post()
		{
			$obj = json_decode($_POST["mydata"]);
			
			$this->load->model('blogging_model');
			$pid = $this->blogging_model->insert_post($obj[0],$obj[1],$obj[0]);
			echo $pid;
		}
	}
?>