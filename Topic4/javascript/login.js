$(document).ready(function(){
		$("#loginForm").submit(function(e) {
		removeFeedback();
		var errors = validateForm();
		if (errors == "") {
			return true;
		} else { 
			provideFeedback(errors);
			e.preventDefault();
			return false;
		}
	});

	function validateForm(){
		var errorFields = new Array();
		if ($("#email").val() == ""){
				errorFields.push("email");
		}
		else if (validateEmail() == false){
				errorFields.push("email");
		}

		if ($('#password').val() ==""){
			errorFields.push('password');
		}
		return errorFields;
	}

	function validateEmail() {
		    var x = $("#email").val();
		    var atpos = x.indexOf("@");
		    var dotpos = x.lastIndexOf(".");
		    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
		       $("#emailError").html("Check email format");
		        return false;
		    }
		    else{
		    	$("#emailError").html("Email is required");
		    	return true;	
		    }
		    
		}

	function provideFeedback(incomingErrors){
		for (var i= 0; i < incomingErrors.length; ++i){
			$("#" + incomingErrors[i]).addClass("errorClass");
			$("#" + incomingErrors[i] + "Error").removeClass("errorFeedback");
		}
		$("#errorDiv").html("Error encountered");

	}

	function removeFeedback(){
		$("#errorDiv").html("");
		$('input').each(function(){
			$(this).removeClass("errorClass");
		});
		$('.errorSpan').each(function(){
			$(this).addClass("errorFeedback");
		});
	}
});