<?php 
	/**
	* 
	*/
	class Activate extends CI_Controller
	{
		
		function __construct()
		{
			parent::__construct();
			$this->load->helper("url");
		}
		public function result($x,$y)
		{
			if(isset($x,$y) && strlen($y) == 32)
			{
				$e = urldecode($x);
				$this->load->model('blogging_model');	
				$this->load->database();			
				$a = $this->db->escape_str($y);
				if($this->blogging_model->update_active_account($e, $a)  == 1)
				{
					$temp['message'] = "<p class=\"message\">Tài khoản của bạn đã được kích hoạt thành công.
					 Bạn có thể <a href='".base_url() ."index.php/login.php'>đăng nhập</a> ngay bây giờ.</p>";
				}
				else
				{
					$temp['message'] = "<p class=\"warning\">kích hoạt tài khoản không thành công.</p>";
				}
				$this->load->view("blogging/vactivate",$temp);
			}
			else
			{
				//redirect_to();
			}
		}
	}
?>