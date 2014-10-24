<?php
	define('BASE_URL', 'http://localhost/Project');
	//mail
	
	function mail_to($mail_address,$subject,$body)
	{
		require "lib/class.phpmailer.php";
		require "lib/class.smtp.php";
		// Khai báo tạo PHPMailer
		$mail = new PHPMailer();
		//Khai báo gửi mail bằng SMTP
		$mail->IsSMTP();
		//Tắt mở kiểm tra lỗi trả về, chấp nhận các giá trị 0 1 2
		// 0 = off không thông báo bất kì gì, tốt nhất nên dùng khi đã hoàn thành.
		// 1 = Thông báo lỗi ở client
		// 2 = Thông báo lỗi cả client và lỗi ở server
		$mail->SMTPDebug  = 0;
		 
		//$mail->Debugoutput = "html"; // Lỗi trả về hiển thị với cấu trúc HTML
		$mail->Host       = "smtp.gmail.com"; //host smtp để gửi mail
		$mail->Port       = 465; // cổng để gửi mail
		$mail->SMTPSecure = 'ssl'; //Phương thức mã hóa thư - ssl hoặc tls
		$mail->SMTPAuth   = true; //Xác thực SMTP
		$mail->Username   = "khoa.kiet.pttkpm@gmail.com"; // Tên đăng nhập tài khoản Gmail
		$mail->Password   = "khoahoangtuankiet"; //Mật khẩu của gmail
		$mail->From = "khoa.kiet.pttkpm@gmail.com";
		$mail->FromName = "localhost";
		$mail->SetFrom("khoa.kiet.pttkpm@gmail.com", "localhost"); // Thông tin người gửi
		$mail->AddReplyTo("khoa.kiet.pttkpm@gmail.com","localhost");// Ấn định email sẽ nhận khngười dùng reply lại.
		$mail->AddAddress($mail_address, "Customer");//Email của người nhận
		$mail->Subject = $subject; //Tiêu đề của thư

		$mail->CharSet = "UTF-8"; 
		$mail->MsgHTML($body); //Nội dung của bức thư.
		// $mail->MsgHTML(file_get_contents("email-template.html"), dirname(__FILE__));
		// Gửi thư với tập tin html
		$mail->AltBody = "Link kích hoạt tài khoản FAbook";//Nội dung rút gọn hiển thị bên ngoài thư mục thư.
		//$mail->AddAttachment("images/attact-tui.gif");//Tập tin cần attach
		 
		//Tiến hành gửi email và kiểm tra lỗi
		if(!$mail->Send()) {
		  echo "Có lỗi khi gửi mail: " . $mail->ErrorInfo;
		  return false;
		} else {
		  return true;
		}
	}

	function redirect_to($page = '/index.php') {
        $url = BASE_URL . $page;
        header("Location: $url");
        exit();
    }
?>