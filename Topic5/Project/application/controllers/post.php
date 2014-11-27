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
			$this->load->model('blogging_model');
			$q_post = $this->blogging_model->load_home_page();
			
			$arr_post = array();
			foreach ($q_post->result_array() as $row)
			{
				$arr_post[] = $row;
			}	
			//echo json_encode($arr_post);		
		}		
	}
?>