$(document).ready(function() {
	var randnum = Math.floor((Math.random() * 100) + 1);
	$('.a-code').val(randnum); 
	var randnum = Math.floor((Math.random() * 100) + 1);
	$('.b-code').val(randnum); 
	$('#sender').click(function(){
		$('.warning').remove();
		 
		if($('.fullname').val() === "")
		{
			$('.fullname').after("<div class=\"warning\">You have to fill this field!</div>");
		}
		if($('.company').val() === "")
		{
			$('.company').after("<div class=\"warning\">You have to fill this field!</div>");
		}
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		if(!emailReg.test($('.email-address').val()))
		{
			$('.email-address').after("<div class=\"warning\">Your email structure have to like youremail@.com !</div>");
		}
		
		if($('.email-address').val() === "")
		{
			$('.email-address').after("<div class=\"warning\">You have to fill this field!</div>");
		}
		if($('.message').val() === "")
		{
			$('.message').after("<div class=\"warning\">You have to fill this field!</div>");
		}
		var string = $('.message').val();
		var len = new Number(string.length);
		if($('.message').val().length > 150)
		{
			$('.message').after("<div class=\"warning\">Your length text have to less than 150 characters!</div>");
		}
		if($('.code-secure').val() === "")
		{
			$('.code-secure').after("<div class=\"warning\">You have to fill this field!</div>");
		}
		var a = new Number($('.a-code').val());
		var b = new Number($('.b-code').val());
		var c = new Number($('.code-secure').val());
		if((a + b) != c)
		{
			$('.code-secure').after("<div class=\"warning\">Your security code is wrong!</div>");
		}
	})
	
	$('#contact').click(function(){
		$('#contact-form').get(0).scrollIntoView();
	})
});
