<?php
class Hello extends CI_Controller{
    public function __construct(){
        parent::__construct();
         $this->load->helper("url");
    }
    public function index(){
        echo "<h3>Hello CodeIgniter Framework - QHOnline.Info</h3>";
        $data['title']="Hello 123";
        $data['account']=array(
                    "username" => "admin",
                    "password" => "12345",
                    "level"    => "2",
        );
        $this->load->view("hello_view",$data);
    }
}
?>